//
//  CollectionViewCell.swift
//  GoGoGithub
//
//  Created by Ryan David on 2/25/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    var post: Owner? {
        
        didSet {

            if let post = self.post, imageString = post.image {
                
                API.getImage(imageString, completion: { (image) -> () in
                    self.imageView.image = image
                })
            }
        }
    }
}
