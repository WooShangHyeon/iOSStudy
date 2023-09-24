//
//  QuickFocusHeaderView.swift
//  HeadSpaceFocus
//
//  Created by 우상현 on 2023/09/24.
//

import UIKit

class QuickFocusHeaderView: UICollectionReusableView {
        
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(_ title: String) {
        titleLabel.text = title
    }
}
