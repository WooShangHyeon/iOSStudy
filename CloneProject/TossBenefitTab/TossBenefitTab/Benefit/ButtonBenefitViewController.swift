//
//  ButtonBenefitViewController.swift
//  TossBenefitTab
//
//  Created by 우상현 on 10/18/23.
//

import UIKit
import Combine


class ButtonBenefitViewController: UIViewController {

    @IBOutlet weak var ctaButton: UIButton!
    @IBOutlet weak var vStackView: UIStackView!
    
    var viewModel: ButtonBenefitViewModel!
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
        viewModel.fetchDetails()
    }
    
    private func bind() {
        //output : data
        viewModel.$benefit
            .receive(on: RunLoop.main)
            .sink { benefit in
                self.ctaButton.setTitle(benefit.ctaTitle, for: .normal)
            }.store(in: &subscriptions)
        
        viewModel.$benefitDetails
            .compactMap { $0 }
            .receive(on: RunLoop.main)
            .sink { details in
                self.addGuides(details: details)
            }.store(in: &subscriptions)
        
        
    }
   
    private func setupUI() {
        ctaButton.layer.masksToBounds = true
        ctaButton.layer.cornerRadius = 5
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addGuides(details: BenefitDetails) {
        let guideview = vStackView.arrangedSubviews.filter { $0 is BenefitGuideView }
        guard guideview.isEmpty else { return }
        
        let guideviews: [BenefitGuideView] = details.guides.map { guide in
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
