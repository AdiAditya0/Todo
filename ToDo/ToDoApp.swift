//
//  ToDoApp.swift
//  ToDo
//
//  Created by deq on 23/12/23.
//

import SwiftUI

@main
struct ToDoApp: App {
    let persistenceStore = PersistenceStore(inMemory: false)

    var body: some Scene {
        WindowGroup {
            RootNavigation()
                .environment(\.managedObjectContext, persistenceStore.container.viewContext)
        }
    }
}
