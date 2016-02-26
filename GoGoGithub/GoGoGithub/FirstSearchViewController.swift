//
//  FirstSearchViewController.swift
//  GoGoGithub
//
//  Created by Ryan David on 2/25/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class FirstSearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    
        var searchArray = [Repository]() {
            didSet
            {
//                self.searchBar.reloadData()

            }
        }
    
        func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
            Repository.update{ (success, repos) -> () in
                self.searchArray = repos
                for repo in repos {
                    print(repo.name)
                }
            }
        }
        
        func scrollViewDidScroll(scrollView: UIScrollView)
        {
            if self.searchBar.isFirstResponder() {
                self.searchBar.resignFirstResponder()
            }
        }
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let searchRepoCell = self.searchTableView.dequeueReusableCellWithIdentifier("Search_Cell", forIndexPath: indexPath)
            let searchRow = self.searchArray[indexPath.row]
            searchRepoCell.textLabel?.text = searchRow.name
            return searchRepoCell
        }
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.searchArray.count
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            
        }
        
        override func viewDidAppear(animated: Bool) {
            super.viewDidAppear(animated)
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
}
