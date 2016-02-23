//
//  ViewController.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/22/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class OAuthViewController: UIViewController, Identity
{

    class func id() -> String
    {
        return "OAuthViewController"
    }
    
    override func prefersStatusBarHidden() -> Bool
    {
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    @IBAction func authorizeButton(sender: UIButton)
    {
        GithubOAuth.shared.oAuthRequestWithScope("email,user,repo")
    }


}

