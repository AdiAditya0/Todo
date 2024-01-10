//
//  TaskDetailViewModel.swift
//  ToDo
//
//  Created by deq on 27/12/23.
//

import SwiftUI
import CoreData

protocol TaskDetailViewModelProtocol: ObservableObject {
    var taskDetail: TaskDetail { get set }
    var context: NSManagedObjectContext { get set }
    var isNewTask: Bool { get set }
    func createTask() -> Void
    func updateTaskDetails() -> Void
    func deleteTask() -> Void
    func addCheckListItem() -> Void
}

class TaskDetailViewModel: TaskDetailViewModelProtocol {
    
    @Published var taskDetail: TaskDetail
    @Published var isNewTask: Bool
    var context: NSManagedObjectContext
    
    init(taskDetail: TaskDetail, isNewTask: Bool) {
        self.context = PersistenceStore(inMemory: false).context
        self.taskDetail = taskDetail
        self.isNewTask = isNewTask
    }
    
    deinit {
        print("Denint")
    }
    
    func createTask() {
        if self.taskDetail.title != "" {
            let tMO = TaskDetailMO(context: context)
            tMO.title = self.taskDetail.title
            tMO.id = self.taskDetail.id
            tMO.taskDescription = self.taskDetail.description
            tMO.dateCreated = self.taskDetail.dateCreated
            try? context.save()
            isNewTask = false
        }
    }
    
    func addCheckListItem() {
        let request: NSFetchRequest<TaskDetailMO> = TaskDetailMO.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", taskDetail.id)
        
        do {
            if let fetchedtask = try context.fetch(request).first {
                let checkListItem = CheckListItemMO(context: context)
                checkListItem.id = UUID().uuidString
                checkListItem.dateCreated = Date.now
                checkListItem.name = "abc"
                checkListItem.status = CheckListItemStatus.pending.rawValue
                fetchedtask.addToCheckListRelation(checkListItem)
                try context.save()
            }
        } catch let error {
            print("Error fetching singers \(error)")
        }
    }
    
    func updateTaskDetails() { }
    
    func deleteTask() { }
}
