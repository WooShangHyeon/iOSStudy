//
//  DetailViewController.swift
//  CarrotHomeTab
//
//  Created by 우상현 on 10/25/23.
//

import UIKit




class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.fetch()
        
    }
    
    private func bind() {
        
    }


}
