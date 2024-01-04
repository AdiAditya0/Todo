//
//  TaskDetail+CoreDataClass.swift
//  ToDo
//
//  Created by deq on 04/01/24.
//
//

import Foundation
import CoreData

@objc(TaskDetail)
public class TaskDetail: NSManagedObject {
    public init(context: NSManagedObjectContext,
                id: UUID = UUID(),
                dateCreated: Date = Date.now,
                title: String,
                taskDescription: String) {
        let entity = NSEntityDescription.entity(forEntityName: "TaskDetail", in: context)!
        super.init(entity: entity, insertInto: context)
        self.id = id
        self.dateCreated = dateCreated
        self.title = title
        self.taskDescription = taskDescription
    }

    @objc
    override private init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    @available(*, unavailable)
    public init() {
        fatalError("\(#function) not implemented")
    }

    @available(*, unavailable)
    public convenience init(context: NSManagedObjectContext) {
        fatalError("\(#function) not implemented")
    }
}
