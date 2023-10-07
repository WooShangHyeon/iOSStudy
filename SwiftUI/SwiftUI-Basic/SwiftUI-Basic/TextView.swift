//
//  TextView.swift
//  SwiftUI-Basic
//
//  Created by 우상현 on 10/7/23.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        Text("SwiftUI")
            .font(.system(size: 40, weight: .bold, design: .default))
    }
}

#Preview {
    TextView()
}
