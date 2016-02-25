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
    
    init(name: String, owner: Owner)
    {
        self.name = name
        self.owner = owner
    }
}
