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
    
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    var viewModel: DetailViewModel!
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configuteNavigationBar()
        bind()
        viewModel.fetch()
        
    }
    
    private func setupUI() {
        userThumbnail.layer.masksToBounds = true
        userThumbnail.layer.cornerRadius = 40
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
                self.itemPriceLabel.text = "\(self.formatPrice(details.item.price))원"
                
            }.store(in: &subscriptions)
    }
    
    private func configuteNavigationBar() {
        let moreConfig = CustomBarItemConfiguration(
            image: UIImage(systemName: "ellipsis"),
            handler: { print("---> more tapped") }
        )
        let moreItem = UIBarButtonItem.generate(with: moreConfig, width: 30)
    
        let shareConfig = CustomBarItemConfiguration(
            image: UIImage(systemName: "square.and.arrow.up"),
            handler: { print("---> share tapped") }
        )
        let shateItem = UIBarButtonItem.generate(with: shareConfig, width: 30)
        
        navigationItem.rightBarButtonItems = [moreItem, shateItem]
        navigationItem.backButtonDisplayMode = .minimal
    }


}

extension DetailViewController {
    private func formatPrice(_ price: Int) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let result = formatter.string(from: NSNumber(integerLiteral: price)) ?? ""
        return result
    }
}
