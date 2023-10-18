//
//  ButtonBenefitViewController.swift
//  TossBenefitTab
//
//  Created by 우상현 on 10/18/23.
//

import UIKit

class ButtonBenefitViewController: UIViewController {

    @IBOutlet weak var ctaButton: UIButton!
    @IBOutlet weak var vStackView: UIStackView!
    
    
    var benefit: Benefit = .today
    var benefitDetails: BenefitDetails = .default
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        addGuides()
        ctaButton.setTitle(benefit.ctaTitle, for: .normal)
        
    }
   
    private func setupUI() {
        ctaButton.layer.masksToBounds = true
        ctaButton.layer.cornerRadius = 5
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addGuides() {
        let guideviews: [BenefitGuideView] = benefitDetails.guides.map { guide in
            let guideView = BenefitGuideView(frame: .zero)
            guideView.icon.image = UIImage(systemName: guide.iconName)
            guideView.title.text = guide.guide
            return guideView
        }
        
        guideviews.forEach { view in
            self.vStackView.addArrangedSubview(view)
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 60)
            ])
        }
    }
}
