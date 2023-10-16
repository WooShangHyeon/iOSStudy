//
//  TodaySectionItem.swift
//  TossBenefitTab
//
//  Created by 우상현 on 10/16/23.
//

import Foundation

struct TodaySectionItem {
    var point: MyPoint
    let today: Benefit
    
    var sectionItems: [AnyHashable] {
        return [point, today]
    }
}

extension TodayBenefitCell {
    static let mock = TodaySectionItem(point: MyPoint(point: 0), today: Benefit.walk)
}
