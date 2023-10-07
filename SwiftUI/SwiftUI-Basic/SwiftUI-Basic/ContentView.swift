//
//  ContentView.swift
//  SwiftUI-Basic
//
//  Created by 우상현 on 10/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ImageView()
            ButtonView()
            TextView()
            Spacer()
            HStack {
                ImageView()
                ButtonView()
                TextView()
            }
            Spacer()
            ZStack {
                ImageView()
                ButtonView()
                TextView()
            }
        }
    }
}

#Preview {
    ContentView()
}
