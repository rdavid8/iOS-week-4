//
//  ProfileViewController.swift
//  GoGoGithub
//
//  Created by Ryan David on 2/24/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, Identity
{
    @IBOutlet weak var imageView: UIImageView!
    var datasource = [Repository]()
    
    class func id() -> String
    {
        return "ProfileViewController"
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    override func didReceiveMemoryWarning()
    {
    super.didReceiveMemoryWarning()
    }
//    var data = NSData(contentsOfURL: NSURL, string: "")
}
