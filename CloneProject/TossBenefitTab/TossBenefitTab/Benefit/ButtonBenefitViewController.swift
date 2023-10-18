//
//  ButtonBenefitViewController.swift
//  TossBenefitTab
//
//  Created by 우상현 on 10/18/23.
//

import UIKit

class ButtonBenefitViewController: UIViewController {

    @IBOutlet weak var ctaButton: UIButton!
    
    var benefit: Benefit = .today
    var benefitDetails: BenefitDetails = .default
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ctaButton.layer.masksToBounds = true
        ctaButton.layer.cornerRadius = 5
    
        navigationItem.largeTitleDisplayMode = .never
        
        ctaButton.setTitle(benefit.ctaTitle, for: .normal)
        
    }
   

}
