//
//  Eka_care_NewsAppApp.swift
//  Eka.care-NewsApp
//
//  Created by Ankur Kumar on 13/03/25.
//

import SwiftUI

@main
struct Eka_care_NewsAppApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabViewPage()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
