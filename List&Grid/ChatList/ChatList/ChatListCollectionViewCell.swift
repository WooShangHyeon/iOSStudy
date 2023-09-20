//
//  ChatListCollectionViewCell.swift
//  ChatList
//
//  Created by 우상현 on 2023/09/19.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        thumnail.layer.cornerRadius = 10
    }
    
    func configure(_ chat: Chat) {
        thumnail.image = UIImage(named: chat.name)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dateLabel.text = formattedDateString(date: chat.date)
    }
    
    func formattedDateString(date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        if let dateString = formatter.date(from: date) {
            formatter.dateFormat = "M/d"
            return formatter.string(from: dateString)
        } else {
            return ""
        }
        
    }
}
