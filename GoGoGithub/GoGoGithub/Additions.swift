//
//  Additions.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/23/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

extension NSMutableURLRequest
{
    class func requestWithAPIRequest(apiRequest: APIRequest) -> NSMutableURLRequest
    {
        let request = NSMutableURLRequest()
        var requestUrl = NSURL(string: "\(apiRequest.url())?")!
        
        if let httpBody = apiRequest.httpBody() {
            request.HTTPBody = httpBody
        }
        
        if let apiQuery = apiRequest.queryStringParameters() {
            var queryArray = [String]()
            var queryString = String()
            
            for (key, value) in apiQuery {
                queryArray.append("\(key)=\(value)")
            }
            queryString = queryArray.joinWithSeparator("&")
            
            if let encodedHost = queryString.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()) {
            requestUrl = NSURL(string: "\(apiRequest.url())?".stringByAppendingString(encodedHost))!
            }
            
            if let apiHeaders = apiRequest.httpHeaders() {
                for (key, value) in apiHeaders {
                    request.setValue(value, forKey: key)
                }
            }
        }
        
        request.URL = requestUrl
        request.HTTPMethod = apiRequest.httpMethod.rawValue
        return request
        
    }
}
