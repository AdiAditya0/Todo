//
//  DashboardViewModel.swift
//  ToDo
//
//  Created by deq on 03/01/24.
//

import Foundation
import CoreData
import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var tasks: [TaskDetail] = []
    @Environment(\.managedObjectContext) var managedObjectContext
    
    init() {
        
    }
    
    func retrieveSavedTasks() {
        let fetchRequest: NSFetchRequest<TaskDetail>
        fetchRequest = TaskDetail.fetchRequest()

//        // Get a reference to a NSManagedObjectContext
//        let context = persistentContainer.viewContext
//
//        // Fetch all objects of one Entity type
//        let objects = try context.fetch(fetchRequest)
    }
}
