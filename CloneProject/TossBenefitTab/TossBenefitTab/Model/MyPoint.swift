//
//  MyPoint.swift
//  TossBenefitTab
//
//  Created by 우상현 on 10/16/23.
//

import Foundation

struct MyPoint: Hashable{
    var point: Int
}

extension MyPoint {
    static let `default` = MyPoint(point: 0)
}
