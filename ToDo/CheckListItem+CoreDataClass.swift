//
//  CheckListItem+CoreDataClass.swift
//  ToDo
//
//  Created by deq on 04/01/24.
//
//

import Foundation
import CoreData

@objc(CheckListItem)
public class CheckListItem: NSManagedObject {
    public init(context: NSManagedObjectContext,
                id: UUID = UUID(),
                dateCreated: Date = Date.now,
                name: String,
                status: Int64) {
        let entity = NSEntityDescription.entity(forEntityName: "TaskDetail", in: context)!
        super.init(entity: entity, insertInto: context)
        self.id = id
        self.dateCreated = dateCreated
        self.name = name
        self.status = status
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
