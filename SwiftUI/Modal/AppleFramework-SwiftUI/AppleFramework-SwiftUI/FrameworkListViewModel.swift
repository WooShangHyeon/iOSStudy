//
//  FrameworkListViewModel.swift
//  AppleFramework-SwiftUI
//
//  Created by 우상현 on 10/10/23.
//

import Foundation


final class FrameworkListViewModel: ObservableObject {
    
    @Published var models: [AppleFramework] = AppleFramework.list
    @Published var isShowingDetail: Bool = false
    @Published var selectedItem: AppleFramework?
    
    
}
