//
//  StoringUserSettingsWithUserDefaults.swift
//  iExpense
//
//  Created by Marko Zivanovic on 19.3.25..
//

import SwiftUI

struct StoringUserSettingsWithUserDefaults: View {
    
    //MARK: - UserDefaults
    //@State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    //MARK: - @AppStorage
    @AppStorage("Tap") private var tapCount: Int = 0
    
    var body: some View {
        Button("Tap count \(tapCount)") {
            tapCount += 1
            
            //UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

#Preview {
    StoringUserSettingsWithUserDefaults()
}
