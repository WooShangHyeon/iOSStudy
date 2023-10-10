//
//  StockRankViewModel.swift
//  StockRank-SwiftUI
//
//  Created by 우상현 on 10/10/23.
//

import Foundation


final class StockRankViewModel: ObservableObject {
    @Published var models: [StockModel] = StockModel.list
    
    var numOfFavorites: Int {
        let favoriteStocks =  models.filter { $0.isFavorite }
        return favoriteStocks.count
    }
    
}
