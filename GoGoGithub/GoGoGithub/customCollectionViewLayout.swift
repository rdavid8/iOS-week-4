//
//  customCollectionViewLayout.swift
//  GoGoGithub
//
//  Created by Ryan David on 2/25/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class customCollectionViewLayout: UICollectionViewFlowLayout
{
    var columns: Int
    let spacing: CGFloat = 1.0
    
    init(columns: Int = 3)
    {
        self.columns = columns
        super.init()
        self.setup()
    }
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) and has no been implemented")
    }
    func setup()
    {
        self.minimumLineSpacing = self.spacing
        self.minimumInteritemSpacing = self.spacing
        self.itemSize = CGSize(width: self.itemWidth() * 0.5, height: self.itemWidth() * 0.5)
    }
    
    // HELPER FUNCTIONS
    func screenWidth() -> CGFloat
    {
        return CGRectGetWidth(UIScreen.mainScreen().bounds)
        
    }
    func itemWidth() -> CGFloat
    {
        let width = self.screenWidth()
        let availableWidth = width - (CGFloat(self.columns) * self.spacing)
        return availableWidth / CGFloat(self.columns)
    }
}

