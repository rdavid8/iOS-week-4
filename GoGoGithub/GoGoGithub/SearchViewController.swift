//
//  SearchBarController.swift
//  GoGoGithub
//
//  Created by Ryan David on 2/24/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.


import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate
{
    let allItems = ["test","","",""]
    var searchItems = [String]()
    var isSearching = false
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var searchBar: UISearchBar!
    
    class func prototypeCellIndentifier() -> String
    {
        return "Search_Cell"
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.searchBar.delegate = self
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(SearchViewController.prototypeCellIndentifier(), forIndexPath: indexPath)
        
        if isSearching {
            cell.textLabel?.text = searchItems[indexPath.row]
        } else {
            cell.textLabel?.text = allItems[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if isSearching{
            return searchItems.count
        }
        
        return allItems.count
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        self.searchItems = []
        
        if let text = searchBar.text {
            self.isSearching = true
            
            for item in allItems{
                if item.containsString(text) {
                    searchItems.append(item)
                }
            }
        }
        
        self.tableView.reloadData()
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String)
    {
        if searchText == "" {
            self.isSearching = false
            self.tableView.reloadData()
        }
    }
}