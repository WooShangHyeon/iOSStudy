//
//  FrameworkListView.swift
//  AppleFramework-SwiftUI
//
//  Created by 우상현 on 10/8/23.
//



import SwiftUI

struct FrameworkListView: View {
    
    @State var list: [AppleFramework] = AppleFramework.list
    
    let layout: [GridItem] = [
//        GridItem(.fixed(70)),
//        GridItem(.adaptive(minimum: 80)),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(list) {item in
                        FrameworkCell(framework: item)
                    }
                }
                .padding([.top, .leading, .trailing], 16.0)
            }
            .navigationTitle("❤️Apple Framework")
        }
    }
}


#Preview {
    FrameworkListView()
}

