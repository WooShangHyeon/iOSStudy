//
//  UIBarButtonItem+CustomView.swift
//  CarrotHomeTab
//
//  Created by 우상현 on 10/26/23.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    static func generate(with config: CustomBarItemConfiguration, width: CGFloat? = nil) -> UIBarButtonItem {
        
        let custimView = CustomBarItem(config: config)
        
        if let width = width {
            NSLayoutConstraint.activate([
                custimView.widthAnchor.constraint(equalToConstant: width)
            ])
        }
        
        let barButtonItem = UIBarButtonItem(customView: custimView)
        return barButtonItem
    }
    
}
