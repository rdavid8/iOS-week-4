//
//  SearchedUserProfileViewController.swift
//  GoGoGithub
//
//  Created by Ryan David on 2/25/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class SearchedUserProfileViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ownerRepoTableView: UITableView!
    var selectedRepo:Repository?
    
    var userRepoArray = [Repository]() {
        didSet {
            self.ownerRepoTableView.reloadData()
        }
    }
    var owner: Owner?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    func setupUser(){
//        if let owner = owner {
//            Repository.update { (success, repos) -> () in
//                self.userRepoArray = repos
//                API.getImage(owner.image!, completion: { (image) -> () in
//                    self.imageView.image = image
//                })
//            }
//        }
//    }
    
    override func viewWillAppear(animated: Bool) {
        if let owner = owner {
            Repository.update { (success, repos) -> () in
                self.userRepoArray = repos
                API.getImage(owner.image!, completion: { (image) -> () in
                    self.imageView.image = image
                })
            }
        }
}




//super.viewWillAppear(animated)
//        Repository.update { (success, user) -> () in
//            print(success)
//            if success {
//                API.getImage(user.image!, completion: { (image) -> () in
//                    self.imageView.image = image
//                })
//            }
//        }
//    }
}
extension SearchedUserProfileViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let userRepoCell = self.ownerRepoTableView.dequeueReusableCellWithIdentifier("UserRepoCell", forIndexPath: indexPath)
        let userRepoRow = userRepoArray[indexPath.row]
        userRepoCell.textLabel?.text = userRepoRow.name
        return userRepoCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userRepoArray.count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier(WebKitViewController.id(), sender: nil)
    }
    
    
}