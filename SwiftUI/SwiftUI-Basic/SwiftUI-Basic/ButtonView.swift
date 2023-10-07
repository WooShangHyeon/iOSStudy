//
//  ButtonView.swift
//  SwiftUI-Basic
//
//  Created by 우상현 on 10/7/23.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        Button {
            print("Button clicked")
        } label: {
            Text("Click Me!")
                .font(.system(size: 20,weight: .bold, design: .default))
                .foregroundColor(.white)
        }
        .padding()
        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        .background(.pink)
        .cornerRadius(20)

    }
}

#Preview {
    ButtonView()
}
