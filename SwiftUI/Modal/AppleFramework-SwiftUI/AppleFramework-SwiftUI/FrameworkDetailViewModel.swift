//
//  FrameworkDetailViewModel.swift
//  AppleFramework-SwiftUI
//
//  Created by 우상현 on 10/11/23.
//

import Foundation
import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    @Published var framework: AppleFramework
    @Published var isSafariPressed: Bool = false
    
    init(framework: AppleFramework) {
        self.framework = framework
    }
}
