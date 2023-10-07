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
        }

    }
}

#Preview {
    ButtonView()
}
