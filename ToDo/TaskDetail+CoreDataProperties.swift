//
//  TaskDetail+CoreDataProperties.swift
//  ToDo
//
//  Created by deq on 04/01/24.
//
//

import Foundation
import CoreData


extension TaskDetail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskDetail> {
        return NSFetchRequest<TaskDetail>(entityName: "TaskDetail")
    }

    @NSManaged public var id: UUID
    @NSManaged public var title: String
    @NSManaged public var taskDescription: String
    @NSManaged public var dateCreated: Date
    @NSManaged public var checkListRelation: NSSet

    public var checkListItems: [CheckListItem] {
        let set = checkListRelation as? Set<CheckListItem> ?? []
        return set.sorted {
            $0.dateCreated < $1.dateCreated
        }
    }
}

// MARK: Generated accessors for checkListRelation
extension TaskDetail {

    @objc(addCheckListRelationObject:)
    @NSManaged public func addToCheckListRelation(_ value: CheckListItem)

    @objc(removeCheckListRelationObject:)
    @NSManaged public func removeFromCheckListRelation(_ value: CheckListItem)

    @objc(addCheckListRelation:)
    @NSManaged public func addToCheckListRelation(_ values: NSSet)

    @objc(removeCheckListRelation:)
    @NSManaged public func removeFromCheckListRelation(_ values: NSSet)

}

extension TaskDetail : Identifiable {

}
