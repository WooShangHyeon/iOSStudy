//
//  UserProfileSettings.swift
//  EnvironmentObjTest
//
//  Created by 우상현 on 10/10/23.
//

import Foundation


final class UserProfileSettings: ObservableObject {
    @Published var name: String = ""
    @Published var age: Int = 0
    
    func haveBirthDayParty() {
        age += 1
    }
}
