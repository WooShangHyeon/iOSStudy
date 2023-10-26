//
//  HomeViewController.swift
//  CarrotHomeTab
//
//  Created by 우상현 on 10/25/23.
//

import UIKit
import Combine

// 홈에 뷰모델을 만들기
// 뷰모델이 리스트 가져오기

class HomeViewController: UIViewController {
    
    let viewModel: HomeViewModel = HomeViewModel(network: NetworkService(configuration: .default))
    var subscriptions = Set<AnyCancellable>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.fetch()
    }
    
    private func bind() {
        viewModel.$items
            .receive(on: RunLoop.main)
            .sink { items in
                print("--> Update collection : \(items)")
            }.store(in: &subscriptions)
        
        viewModel.itemTapped
            .sink { items in
                let sb = UIStoryboard(name: "Detail", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }.store(in: &subscriptions)
    }
    
    
    
}


//@IBAction func ctaButtonTapped(_ sender: Any) {
//    
//    let sb = UIStoryboard(name: "Detail", bundle: nil)
//    
//    let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//    
//    navigationController?.pushViewController(vc, animated: true)
//}
