//
//  CollectionViewController.swift
//  GoGoGithub
//
//  Created by Ryan David on 2/25/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UISearchBarDelegate, UIViewControllerTransitioningDelegate
{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let customTransition = CustomModalTransition(duration: 2.0)
    var selectedItem: Owner?
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SearchedUserProfileViewController" {
            guard let WebKitViewController = segue.destinationViewController as? SearchedUserProfileViewController else { return }
            WebKitViewController.transitioningDelegate = self
            WebKitViewController.owner = self.selectedItem
        }
        func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?
        {
            return self.customTransition
        }
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
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.selectedItem = self.datasource[indexPath.row]
        self.performSegueWithIdentifier("SearchedUserProfileViewController", sender: nil)
    }
}


