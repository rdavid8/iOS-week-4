//
//  HomeViewController.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/23/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, Identity
{
    @IBOutlet weak var repositoriesView: UITableView!
    
    var datasource = [Repository]() {
        didSet {
            self.repositoriesView.reloadData()
        }
    }
    class func id() -> String
    {
        return "HomeViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateTableView()
        self.setUpTableView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUpTableView()
    {
        self.getRepo()
        self.repositoriesView.dataSource = self
        self.repositoriesView.estimatedRowHeight = 100
        self.repositoriesView.rowHeight = UITableViewAutomaticDimension
    }
    
    func updateTableView() {
        Repository.update { (success, respositories) -> () in
            if success {
                self.datasource = respositories
                print("count\(self.datasource.count)")
            }
        }
    }
            func updateOwner() {
                Owner.update { (success, user) -> () in
                    if success{
                        print(user.name)
                    }
            }
            }
    
    
    func getRepo()
    {
    Repository.update { (success, repositories) -> () in
        if success {
        self.datasource = repositories
        
        }
    }
}
}
extension HomeViewController
{
    func configureCellForIndexPath(indexPath: NSIndexPath) -> UITableViewCell
    {
        let repositoriesCell = self.repositoriesView.dequeueReusableCellWithIdentifier("repositoriesCell", forIndexPath: indexPath)
        let repos = self.datasource[indexPath.row]
        repositoriesCell.textLabel?.text = repos.name
        
        return repositoriesCell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.datasource.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        return self.configureCellForIndexPath(indexPath)
    }
}


//                print(repo.name)
//                print(repo.owner.name)
//

