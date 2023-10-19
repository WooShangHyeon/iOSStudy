//
//  BenefitListViewModel.swift
//  TossBenefitTab
//
//  Created by 우상현 on 10/19/23.
//

import Foundation
import Combine

final class BenefitListViewModel {
    
    @Published var todaySectionItems: [AnyHashable] = []
    @Published var otherSectionItems: [AnyHashable] = []
    
    let benefitDidTapped = PassthroughSubject<Benefit, Never>()
    let poinDidTapped = PassthroughSubject<MyPoint, Never>()
    
    
    
    func fetchItems() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.todaySectionItems = TodaySectionItem(point: .default, today: .today).sectionItems
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.otherSectionItems = Benefit.others
        }
    }
}
