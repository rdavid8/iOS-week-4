//
//  POSTRepositoriesRequest.swift
//  GoGoGithub
//
//  Created by Ryan David on 2/24/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class POSTRepositoriesRequest: APIRequest
{
    var httpMethod = HTTPMethod.POST
    var headerContentType = MIMEType.ApplicationJSON
    
    func url() -> String {
        return "https://api.github.com/user/repos"
    }
    
    func queryStringParameters() -> [String : String]?
    {
        do {
            let token = try GithubOAuth.shared.accessToken()
            return ["access_token" : token]
        } catch _ {}
        return nil
    }
}
