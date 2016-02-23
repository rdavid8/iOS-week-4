//
//  HomeViewController.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/23/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, Identity
{
    
    class func id() -> String
    {
        return "HomeViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    @IBAction func printRepositoryButton(sender: UIButton)
    {
        Repository.update { (success, repositories) -> () in
            for repo in repositories {
                print(repo.name)
                
            }
        }
    }
    


}
