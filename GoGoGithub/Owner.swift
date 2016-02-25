//
//  Owner.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/23/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class Owner
{
    let name: String
    let reposUrl: String
    let location: String
    let image: String?
    
    
    init(name: String, reposUrl: String, location: String, image: String? = nil)
    {
        self.name = name
        self.reposUrl = reposUrl
        self.location = location
        self.image = image
    }
}
