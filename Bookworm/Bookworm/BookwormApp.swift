//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Bengi Anıl on 23.10.2023.
//

import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        @StateObject var dataController = DataController()
        
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
