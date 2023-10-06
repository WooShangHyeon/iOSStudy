//
//  FrameworkDetailViewModel.swift
//  AppleFramework
//
//  Created by 우상현 on 10/6/23.
//

import Foundation
import Combine

final class FrameworkDetailViewModel {
    
    init(framework: AppleFramework) {
        self.framework = CurrentValueSubject(framework)
    }
    
    
    let framework: CurrentValueSubject<AppleFramework, Never>
    
    
    let buttonTapped = PassthroughSubject<AppleFramework, Never>()
    
    func learnMoreTapped() {
        buttonTapped.send(framework.value)
    }
    
    
}
