//
//  HomeViewController.swift
//  CarrotHomeTab
//
//  Created by 우상현 on 10/25/23.
//

import UIKit

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
