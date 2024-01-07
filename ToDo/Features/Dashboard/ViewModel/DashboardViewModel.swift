//
//  DashboardViewModel.swift
//  ToDo
//
//  Created by deq on 03/01/24.
//

import Foundation
import CoreData

class DashboardViewModel: ObservableObject {
    @Published var tasks: [TaskDetail] = []
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func retrieveSavedTasks() {
        let fetchRequest: NSFetchRequest<TaskDetailMO>
        fetchRequest = TaskDetailMO.fetchRequest()

        // Fetch all objects of one Entity type
        if let objects = try? context.fetch(fetchRequest) {
            self.tasks = objects.map {
                return TaskDetail(taskDetailMO: $0)
            }
        }
    }
}
