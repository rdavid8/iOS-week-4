////
////  Search.swift
////  GoGoGithub
////
////  Created by Ryan David on 2/24/16.
////  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class Search: APIRequest
{
    var httpMethod = HTTPMethod.GET
    var headerContentType = MIMEType.ApplicationJSON
    var searchResult: String
    
    
    func url() -> String {
        return "https://api.github.com/search/repositories"
    }
    
    func queryStringParameters() -> [String : String]?
    {
    return ["q" : searchResult]
        
    }
    
    init(searchResult: String) {
        self.searchResult = searchResult
    }
}