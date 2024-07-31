//
//  fetch_ios_chalApp.swift
//  fetch-ios-chal
//
//  Created by Siddharth Jain on 7/31/24.
//

import SwiftUI

@main
struct fetch_ios_chalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
