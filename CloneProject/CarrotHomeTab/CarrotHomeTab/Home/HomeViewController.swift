//
//  HomeViewController.swift
//  CarrotHomeTab
//
//  Created by 우상현 on 10/25/23.
//

import UIKit

// 홈에 뷰모델을 만들기
// 뷰모델이 리스트 가져오기

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    @IBAction func ctaButtonTapped(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Detail", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
