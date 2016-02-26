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
    var imageURL = "https://avatars.githubusercontent.com/u/15052381?v=3"
    
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
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        Owner.update { (success, user) -> () in
            print(success)
            if success {
                    self.userLabel.text = user.name
                    self.locationLabel.text = user.location
                    print(user.image)
                    API.getImage(user.image!, completion: { (image) -> () in
                        self.imageView.image = image
            })
        }
    }
}
}