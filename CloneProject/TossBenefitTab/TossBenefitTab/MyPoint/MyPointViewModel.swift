//
//  MyPointViewModel.swift
//  TossBenefitTab
//
//  Created by 우상현 on 10/19/23.
//

import Foundation

final class MyPointViewModel {
    @Published var point: MyPoint
    
    init(point: MyPoint) {
        self.point = point
    }
}
