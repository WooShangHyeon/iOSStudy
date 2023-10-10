//
//  SecondView.swift
//  EnvironmentObjTest
//
//  Created by 우상현 on 10/10/23.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack(spacing: 20) {
            NavigationLink {
                ThirdView()
            } label: {
                Text("Third View")
            }
        }
        .navigationTitle("SecondView")
    }
}

#Preview {
    SecondView()
}
