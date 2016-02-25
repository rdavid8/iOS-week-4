//
//  requestUser.swift
//  GoGoGithub
//
//  Created by Ryan David on 2/24/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class requestUser: APIRequest {
    
    var httpMethod =  HTTPMethod.GET
    
    var headerContentType = MIMEType.ApplicationJSON
    
    func url() -> String {
        return "https://api.github.com/user"
    }
    
    func queryStringParameters() -> [String: String]? {
        do {
            let token = try GithubOAuth.shared.accessToken()
            return ["access_token" : token]
        } catch _ {}
        
        return nil
    }
    
}
