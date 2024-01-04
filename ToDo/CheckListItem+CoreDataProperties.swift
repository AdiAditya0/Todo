//
//  CheckListItem+CoreDataProperties.swift
//  ToDo
//
//  Created by deq on 04/01/24.
//
//

import Foundation
import CoreData


extension CheckListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CheckListItem> {
        return NSFetchRequest<CheckListItem>(entityName: "CheckListItem")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var status: Int64
    @NSManaged public var dateCreated: Date
    @NSManaged public var taskRelation: TaskDetail

}

extension CheckListItem : Identifiable {

}
