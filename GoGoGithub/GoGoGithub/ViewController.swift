//
//  ViewController.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/22/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func authorizeButton(sender: UIButton)
    {
        GithubOAuth.shared.oAuthRequestWithScope("email,user,repo")
    }

    @IBAction func printTokenButton(sender: UIButton)
    {
        do{
            let token = try GithubOAuth.shared.accessToken()
            print(token)
        } catch _ {}
    }
}

