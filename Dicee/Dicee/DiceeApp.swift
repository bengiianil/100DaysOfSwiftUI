//
//  DiceeApp.swift
//  Dicee
//
//  Created by Bengi Anıl on 13.03.2023.
//

import SwiftUI

@main
struct DiceeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(leftDiceNumber: 1, rightDiceNumber: 1)
        }
    }
}
