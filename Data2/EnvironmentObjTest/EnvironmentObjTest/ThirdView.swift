//
//  ThirdView.swift
//  EnvironmentObjTest
//
//  Created by 우상현 on 10/10/23.
//

import SwiftUI

struct ThirdView: View {
    
    @EnvironmentObject var userProfile: UserProfileSettings
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Current Age: \(userProfile.age)")
            Text("Third View")
            
            Button {
                userProfile.haveBirthDayParty()
            } label: {
                Text("Having Birthday Party")
            }
        }
        .navigationTitle("FirstView")
    }
}

#Preview {
    ThirdView().environmentObject(UserProfileSettings())
}
