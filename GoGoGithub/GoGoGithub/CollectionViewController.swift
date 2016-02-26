//
//  CollectionViewController.swift
//  GoGoGithub
//
//  Created by Ryan David on 2/25/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UISearchBarDelegate
{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    var datasource = [Owner]()
        {
        didSet {
            self.collectionView.reloadData()
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.title = "Collection"
        self.collectionView.collectionViewLayout = customCollectionViewLayout()
    }
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        if let text = searchBar.text {
            Owner.searchUsers(text, completion: { (success, users) -> () in
                self.datasource = users
            })
        }
    }
}

extension CollectionViewController: UICollectionViewDataSource
{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.datasource.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let collectionCell = self.collectionView.dequeueReusableCellWithReuseIdentifier("userCollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
        collectionCell.post = self.datasource[indexPath.row]
        return collectionCell
    }
    
}

