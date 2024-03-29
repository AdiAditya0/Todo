//
//  CoreDataManager.swift
//  ToDo
//
//  Created by deq on 05/01/24.
//

import Foundation
import CoreData

class CoreDataManager: NSObject, NSFetchedResultsControllerDelegate {
    
    static let shared = CoreDataManager()
    
    fileprivate var managedObjectContext: NSManagedObjectContext
    private let todosFRC: NSFetchedResultsController<TaskDetailMO>
    private let projectsFRC: NSFetchedResultsController<CheckListItemMO>
    
    override private init() {
        let persistentStore = PersistenceStore(inMemory: false)
        self.managedObjectContext = persistentStore.context
        
        let todoFR: NSFetchRequest<TaskDetailMO> = TaskDetailMO.fetchRequest()
        todoFR.sortDescriptors = [NSSortDescriptor(key: "dateCreated", ascending: false)]
        todosFRC = NSFetchedResultsController<TaskDetailMO>(fetchRequest: todoFR,
                                              managedObjectContext: managedObjectContext,
                                              sectionNameKeyPath: nil,
                                              cacheName: nil)

        let projectFR: NSFetchRequest<CheckListItemMO> = CheckListItemMO.fetchRequest()
        projectFR.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        projectsFRC = NSFetchedResultsController<CheckListItemMO>(fetchRequest: projectFR,
                                                 managedObjectContext: managedObjectContext,
                                                 sectionNameKeyPath: nil,
                                                 cacheName: nil)
        
        super.init()
        
        // Initial fetch to populate todos array
        todosFRC.delegate = self
        try? todosFRC.performFetch()
        if let newTodos = todosFRC.fetchedObjects {
            print(newTodos)
        }

        projectsFRC.delegate = self
        try? projectsFRC.performFetch()
        if let newProjects = projectsFRC.fetchedObjects {
            print(newProjects)
        }
    }
    
    func saveData() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch let error as NSError {
                NSLog("Unresolved error saving context: \(error), \(error.userInfo)")
            }
        }
    }
}

//extension CoreDataManager: NSFetchedResultsControllerDelegate {
//    
//    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        if let newTodos = controller.fetchedObjects as? [TodoMO] {
//            self.todos = OrderedDictionary(uniqueKeysWithValues: newTodos.map({ ($0.id!, Todo(todoMO: $0)) }))
//        } else if let newProjects = controller.fetchedObjects as? [ProjectMO] {
//            print(newProjects)
//            self.projects = OrderedDictionary(uniqueKeysWithValues: newProjects.map({ ($0.id!, Project(projectMO: $0)) }))
//        }
//    }
//    
//    private func fetchFirst<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate?) -> Result<T?, Error> {
//        let request = objectType.fetchRequest()
//        request.predicate = predicate
//        request.fetchLimit = 1
//        do {
//            let result = try managedObjectContext.fetch(request) as? [T]
//            return .success(result?.first)
//        } catch {
//            return .failure(error)
//        }
//    }
//    
////    func fetchTodos(predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) {
////        if let predicate = predicate {
////            todosFRC.fetchRequest.predicate = predicate
////        }
////        if let sortDescriptors = sortDescriptors {
////            todosFRC.fetchRequest.sortDescriptors = sortDescriptors
////        }
////        try? todosFRC.performFetch()
////        if let newTodos = todosFRC.fetchedObjects {
////            self.todos = OrderedDictionary(uniqueKeysWithValues: newTodos.map({ ($0.id!, Todo(todoMO: $0)) }))
////        }
////    }
////
////    func resetFetch() {
////        todosFRC.fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
////        todosFRC.fetchRequest.predicate = nil
////        try? todosFRC.performFetch()
////        if let newTodos = todosFRC.fetchedObjects {
////            self.todos = OrderedDictionary(uniqueKeysWithValues: newTodos.map({ ($0.id!, Todo(todoMO: $0)) }))
////        }
////    }
//
//}

//MARK: - Todo Methods
//extension Todo {
//
//    fileprivate init(todoMO: TodoMO) {
//        self.id = todoMO.id ?? UUID()
//        self.title = todoMO.title ?? ""
//        self.date = todoMO.date ?? Date()
//        self.isComplete = todoMO.isComplete
//        if let projectMO = todoMO.projectMO {
//            self.projectID = projectMO.id
//        }
//    }
//}

//extension CoreDataManager {
//
//    func updateAndSave(todo: Todo) {
//        let predicate = NSPredicate(format: "id = %@", todo.id as CVarArg)
//        let result = fetchFirst(TodoMO.self, predicate: predicate)
//        switch result {
//        case .success(let managedObject):
//            if let todoMo = managedObject {
//                update(todoMO: todoMo, from: todo)
//            } else {
//                todoMO(from: todo)
//            }
//        case .failure(_):
//            print("Couldn't fetch TodoMO to save")
//        }
//
//        saveData()
//    }
//
//    func delete(todo: Todo) {
//        let predicate = NSPredicate(format: "id = %@", todo.id as CVarArg)
//        let result = fetchFirst(TodoMO.self, predicate: predicate)
//        switch result {
//        case .success(let managedObject):
//            if let todoMo = managedObject {
//                managedObjectContext.delete(todoMo)
//            }
//        case .failure(_):
//            print("Couldn't fetch TodoMO to save")
//        }
//        saveData()
//    }
//
//    func getTodo(with id: UUID) -> Todo? {
//        return todos[id]
//    }
//
//    private func todoMO(from todo: Todo) {
//        let todoMO = TodoMO(context: managedObjectContext)
//        todoMO.id = todo.id
//        update(todoMO: todoMO, from: todo)
//    }
//
//    private func update(todoMO: TodoMO, from todo: Todo) {
//        todoMO.title = todo.title
//        todoMO.date = todo.date
//        todoMO.isComplete = todo.isComplete
//        if let id = todo.projectID, let project = getProject(with: id) {
//            todoMO.projectMO = getProjectMO(from: project)
//        } else {
//            todoMO.projectMO = nil
//        }
//    }
//
//    ///Get's the TodoMO that corresponds to the todo. If no TodoMO is found, returns nil.
//    private func getTodoMO(from todo: Todo?) -> TodoMO? {
//        guard let todo = todo else { return nil }
//        let predicate = NSPredicate(format: "id = %@", todo.id as CVarArg)
//        let result = fetchFirst(TodoMO.self, predicate: predicate)
//        switch result {
//        case .success(let managedObject):
//            if let todoMO = managedObject {
//                return todoMO
//            } else {
//                return nil
//            }
//        case .failure(_):
//            return nil
//        }
//
//    }
//
//}

//MARK: - Project Methods
//extension Project {
//    fileprivate init(projectMO: ProjectMO) {
//        self.id = projectMO.id ?? UUID()
//        self.title = projectMO.title ?? ""
//        if let todoMOs = projectMO.todoMOs as? Set<TodoMO> {
//            let todoMOsArray = todoMOs.sorted(by: {$0.title! < $1.title!})
//            self.todoIDs = todoMOsArray.compactMap({$0.id})
//        }
//    }
//}

//extension CoreDataManager {
//    func updateAndSave(project: Project) {
//        let predicate = NSPredicate(format: "id = %@", project.id as CVarArg)
//        let result = fetchFirst(ProjectMO.self, predicate: predicate)
//        switch result {
//        case .success(let managedObject):
//            if let projectMO = managedObject {
//                update(projectMO: projectMO, from: project)
//            } else {
//                createProjectMO(from: project)
//            }
//        case .failure(_):
//            print("Couldn't fetch ProjectMO to save")
//        }
//
//        saveData()
//    }
//
//    func getProject(with id: UUID) -> Project? {
//        return projects[id]
//    }
//
//    private func createProjectMO(from project: Project) {
//        let projectMO = ProjectMO(context: managedObjectContext)
//        projectMO.id = project.id
//        update(projectMO: projectMO, from: project)
//    }
//
//    private func update(projectMO: ProjectMO, from project: Project) {
//        projectMO.title = project.title
//        let todoMOs = project.todoIDs.compactMap({getTodoMO(from:getTodo(with: $0))})
//        projectMO.todoMOs = NSSet(array: todoMOs)
//    }
//
//    ///Get's the ProjectMO that corresponds to the project. If no ProjectMO is found, returns nil.
//    private func getProjectMO(from project: Project? ) -> ProjectMO? {
//        guard let project = project else { return nil }
//        let predicate = NSPredicate(format: "id = %@", project.id as CVarArg)
//        let result = fetchFirst(ProjectMO.self, predicate: predicate)
//        switch result {
//        case .success(let managedObject):
//            if let projectMO = managedObject {
//                return projectMO
//            } else {
//                return nil
//            }
//        case .failure(_):
//            return nil
//        }
//    }
//}
