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
                guard let ownerDictionary = eachRepository["owner"] as? [String : AnyObject] else { fatalError("Can't retrieve owner") }
                let reposUrl = ownerDictionary["repos_url"] as? String ?? kEmptyString
                let login = ownerDictionary["login"] as? String ?? kEmptyString
                let location = kEmptyString
                let owner = Owner(name: login, reposUrl: reposUrl, location: location)
                let repo = Repository(name: name, owner: owner, location: location)
                
//                print(repo.name)
//                print(repo.owner.name)
//                print("")
//                
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

    class func ownerJSON(json:[String : AnyObject] ) -> Owner? {
        
        guard let name = json["login"] as? String else { fatalError("Can't get username")}
        let id = kEmptyString
        let location = kEmptyString
        return Owner(name: name, reposUrl: id, location: location)
    }
    func description() -> String {
        return self.name
    }
}
extension Owner {
    
    class func update(completion: (success: Bool, user: Owner) -> ()) {
        API.shared.enqueue(requestUser()) { (success, json) -> () in
            
            let input = json[0]
            print(input)
            
            let name = input["login"] as? String ?? kEmptyString
            let reposUrl = input["repos_url"] as? String ?? kEmptyString
            let location = input["location"] as? String ?? kEmptyString
            let image = input["avatar_url"] as? String ?? kEmptyString
            
            let owner = Owner(name: name, reposUrl: reposUrl, location: location, image: image)
    }
}
}
