//
//  DetailViewController.swift
//  CarrotHomeTab
//
//  Created by 우상현 on 10/25/23.
//

import UIKit
import Combine
import Kingfisher

class DetailViewController: UIViewController {
    
    // User
    @IBOutlet weak var userThumbnail: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    @IBOutlet weak var userTemperature: UILabel!
    
    // Item
    @IBOutlet weak var itemThumbnail: UIImageView!
    @IBOutlet weak var iteminfoTitel: UILabel!
    @IBOutlet weak var iteminfoDescription: UILabel!
    
    var viewModel: DetailViewModel!
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.fetch()
        
    }
    
    private func bind() {
        viewModel.$itemInfoDetails
            .compactMap { $0 }
            .receive(on: RunLoop.main)
            .sink { details in
                self.userThumbnail.kf.setImage(with: URL(string: details.user.thumnail))
                self.userName.text = details.user.name
                self.userLocation.text = details.user.location
                self.userTemperature.text = "\(details.user.temperature)°C"
                
                self.itemThumbnail.kf.setImage(with: URL(string: details.item.thumbnailURL))
                self.iteminfoTitel.text = details.item.title
                self.iteminfoDescription.text = details.details.descriptions
                
            }.store(in: &subscriptions)
    }


}
