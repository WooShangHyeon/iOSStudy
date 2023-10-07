//
//  PlayingStatusView.swift
//  DataFlow-SwiftUI
//
//  Created by 우상현 on 10/7/23.
//

import SwiftUI

struct PlayingStatusView: View {
    
    @Binding var isPlaying: Bool
    
    var body: some View {
        Image(systemName: isPlaying ? "sun.max.fill" : "sun.max")
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 80, height: 80)
    }
}
