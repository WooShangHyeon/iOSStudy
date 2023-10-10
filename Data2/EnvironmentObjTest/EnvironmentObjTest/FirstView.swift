//
//  ContentView.swift
//  EnvironmentObjTest
//
//  Created by joonwon lee on 2022/06/12.
//

import SwiftUI

struct FirstView: View {
    
    @EnvironmentObject var userProfile: UserProfileSettings
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Current Age: \(userProfile.age)")
                NavigationLink {
                    SecondView()
                } label: {
                    Text("Second View")
                }
                
                Button {
                    userProfile.haveBirthDayParty()
                } label: {
                    Text("Having Birthday Party")
                }
            }
            .navigationTitle("FirstView")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView().environmentObject(UserProfileSettings())
    }
}
