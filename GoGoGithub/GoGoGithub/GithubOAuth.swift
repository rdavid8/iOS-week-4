//
//  GithubOAuth.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/22/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

typealias GithubOAuthCompletion = (success: Bool) -> ()

let kAccessTokenKey = "kAccessTokenKey"
let kOAuthBaseURLString = "https://github.com/login/oauth/"
let KAccessTokenRegexPattern = "access_token=([^&]+)"
let kEmptyString = ""

enum SaveOptions
{
    case Keychain
    case UserDefaults
}


enum GithubError: ErrorType
{
    case MissingAccessToken(String)
    case ResponseFromGithub
}


class GithubOAuth
{
    
    private var githubClientId = "7f27f2dfb13d6c20ac48"
    private var githubClientSecret = "49376b0eeb41c5bd9d3c5f99e423395895e50307"
    
    static let shared = GithubOAuth()
    private init () {}
    
    
    func oAuthRequestWithScope(scope: String)
    {
        guard let requestURL = NSURL(string: "\(kOAuthBaseURLString)authorize?client_id=\(githubClientId)&scope=\(scope)") else { fatalError() }
        
         UIApplication.sharedApplication().openURL(requestURL)
    }
    
    func tokenRequestWithCallbackURL(url: NSURL, options: SaveOptions, completion: GithubOAuthCompletion)
    {
        guard let codeString = url.query else { return }
        
        print(codeString)
        guard let requestURL = NSURL(string: "\(kOAuthBaseURLString)/access_token?client_id=\(self.githubClientId)&client_secret=\(self.githubClientSecret)&\(codeString)") else { return }
        
        let request = self.requestWith(requestURL, method: "POST")
        
        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            if let _ = error { print("error...\(error)") }
            if let data = data {
                do {
                    if let json = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [String : AnyObject], token = self.accessTokenFrom(json) {
                        
                        NSOperationQueue.mainQueue().addOperationWithBlock({ ()
                            switch options {
                            case .Keychain: self.saveAccessTokenToKeychain(token)
                            case .UserDefaults: self.saveAccessTokenToUserDefaults(token)
                            }
                        })
                    }
                    
                } catch _ { completion(success: false) }
                
            } else {completion(success: false)}
            
            }.resume()
    }

    func accessToken() throws -> String
    {
        var accessToken: String?
        if let token = self.accessTokenFromKeychain() { accessToken = token }
        if let token = self.accessTokenFromUserDefaults() { accessToken = token }
        
        guard let token = accessToken else {
            throw GithubError.MissingAccessToken("You dont have access token saved") }

        
        return token
        
    }
    
    private func accessTokenFromUserDefaults() -> String?
    {
     return NSUserDefaults.standardUserDefaults().stringForKey(kAccessTokenKey)
    }
    
    private func requestWith(url: NSURL, method: String) -> NSMutableURLRequest
    {
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    
    private func accessTokenFrom(json: [String: AnyObject?]) -> String?
    {
        guard let token = json["access_token"] as? String else { return nil }
        print(token)
        return token
    }
    
    private func saveAccessTokenToUserDefaults(token: String) -> Bool
    {
        NSUserDefaults.standardUserDefaults().setObject(token, forKey: kAccessTokenKey)
        return NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    private func accessTokenFromKeychain() -> String?
    {
        
        var keychainQuery = self.getKeychainQuery(kAccessTokenKey)
        keychainQuery[(kSecReturnData as String)] = kCFBooleanTrue
        keychainQuery[(kSecMatchLimit as String)] = kSecMatchLimitOne
        var dataRef: AnyObject?
        
        if SecItemCopyMatching(keychainQuery, &dataRef) == noErr {
            if let data = dataRef as? NSData {
                if let token = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? String {
                    return token
                }
            }

        }
          return kEmptyString
    }
    
    private func saveAccessTokenToKeychain(token: String) -> Bool
    {
      var keychainQuery = self.getKeychainQuery(kAccessTokenKey)
        keychainQuery[(kSecValueData as String)] = NSKeyedArchiver.archivedDataWithRootObject(token)
        SecItemDelete(keychainQuery)
        return SecItemAdd(keychainQuery, nil) == errSecSuccess
    }
    
    private func getKeychainQuery(query: String) -> [String: AnyObject]
    {
        return [
            (kSecClass as String) : kSecClassGenericPassword,
            (kSecAttrService as String) : query,
            (kSecAttrAccount as String) : query,
            (kSecAttrAccessible as String) : kSecAttrAccessibleAfterFirstUnlock]
    }
}



