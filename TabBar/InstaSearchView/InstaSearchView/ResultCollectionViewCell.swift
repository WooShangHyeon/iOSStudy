//
//  ResultCollectionViewCell.swift
//  InstaSearchView
//
//  Created by 우상현 on 2023/09/20.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
    }
    
    func configure(_ imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
