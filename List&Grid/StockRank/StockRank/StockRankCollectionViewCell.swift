//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by 우상현 on 2023/09/18.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var rankLabel: UILabel!
    
    @IBOutlet weak var companyIconImageView: UIImageView!
    
    @IBOutlet weak var companyNameLabel: UILabel!
    
    @IBOutlet weak var companyPriceLabel: UILabel!
    
    @IBOutlet weak var diffLabel: UILabel!
    
    func configure(_ stock: StockModel) {
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: "\(stock.imageName)")
        companyNameLabel.text = stock.name
        companyPriceLabel.text = "\(convertToCurrencyFormat(price: stock.price))"
        
        diffLabel.textColor = stock.diff > 0 ? UIColor.systemRed : UIColor.systemBlue
        diffLabel.text = "\(stock.diff)%"
    }
    func convertToCurrencyFormat(price: Int) -> String{
        let numberFormater = NumberFormatter()
        numberFormater.numberStyle = .decimal
        numberFormater.maximumFractionDigits = 0
        let result = numberFormater.string(from: NSNumber(value: price)) ?? ""
        return result
    }
    
}
