//
//  ModelAdditions.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/23/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

extension Repository
{
    class func update(completion: (success: Bool, repositories: [Repository]) -> ())
    {
        API.shared.enqueue(GETRepositoriesRequest()) { (success, json) -> () in
            var repositories = [Repository]()
            
            for eachRepository in json {
                let name = eachRepository["name"] as? String ?? kEmptyString
                repositories.append(Repository(name: name))
            }
            
            NSOperationQueue.mainQueue().addOperationWithBlock { completion(success: true, repositories: repositories) }
        }
    }
    
    func description() -> String
    {
        return self.name
    }
}
