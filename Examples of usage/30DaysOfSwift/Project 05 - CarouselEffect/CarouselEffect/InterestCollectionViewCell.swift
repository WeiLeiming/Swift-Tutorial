//
//  InterestCollectionViewCell.swift
//  CarouselEffect
//
//  Created by willwei on 2017/6/22.
//  Copyright © 2017年 qj-vr. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    
    // MARK: - Properties
    
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Private Method
    
    func updateUI() {
        self.interestTitleLabel.text = self.interest.title
        featuredImageView.image = self.interest.featuredImage
    }
    
}
