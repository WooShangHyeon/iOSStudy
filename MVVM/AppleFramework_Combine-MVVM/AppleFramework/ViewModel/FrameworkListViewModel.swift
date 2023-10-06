//
//  FrameworkListViewModel.swift
//  AppleFramework
//
//  Created by 우상현 on 10/6/23.
//

import Foundation
import Combine

final class FrameworkListViewModel {
    
    
    init(items: [AppleFramework], selectedItem: AppleFramework? = nil) {
        self.items = CurrentValueSubject(items)
        self.selectedItem = CurrentValueSubject(selectedItem)
    }
    
    let items: CurrentValueSubject<[AppleFramework], Never>
    let selectedItem: CurrentValueSubject<AppleFramework?, Never>
    
    
    func didSelect(at indexPath: IndexPath) {
        let item = items.value[indexPath.item]
        selectedItem.send(item)
    }
    
    
    
    
}
