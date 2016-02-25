//
//  Repository.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/23/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//
//
import UIKit

class Repository
{
    let name: String
    let owner: Owner
    let location: String
    
    init(name: String, owner: Owner, location: String)
    {
        self.name = name
        self.owner = owner
        self.location = location
    }
}
