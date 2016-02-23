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
                guard let ownerDictionary = eachRepository["owner"] as? [String : AnyObject] else { return }
                let reposUrl = ownerDictionary["repos_url"] as? String ?? kEmptyString
                let login = ownerDictionary["login"] as? String ?? kEmptyString
                let owner = Owner(reposUrl: reposUrl, name: login)
                
                let name = eachRepository["name"] as? String ?? kEmptyString
                
                let repo = Repository(name: name, owner: owner)
                
                repositories.append(repo)
                
                // 1. Get owner dictionary from eachRepository
                // 2. Get reposUrl and login from owner dicitonary
                // 3. Instantiate your owner object
                // 4. Instantiate your repository object and pass in your owner
                // 5. APpend to array of repos.
                
            }
            
            NSOperationQueue.mainQueue().addOperationWithBlock { completion(success: true, repositories: repositories) }
        }
    }
    
    func description() -> String
    {
        return self.name
        
    }
}

