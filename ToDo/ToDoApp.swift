//
//  ToDoApp.swift
//  ToDo
//
//  Created by deq on 23/12/23.
//

import SwiftUI

@main
struct ToDoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RootNavigation()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
