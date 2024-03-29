//
//  TaskDetailModels.swift
//  ToDo
//
//  Created by deq on 27/12/23.
//

import Foundation

enum CheckListItemStatus: Int64, Codable {
    case pending = 0
    case complete
    case cancelled
}

struct CheckListItem: Codable, Identifiable {
    var id: String = UUID().uuidString
    let name: String
    let status: CheckListItemStatus
    let dateCreated: Date
}

struct TaskDetail: Codable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var description: String
    var checkList: [CheckListItem]
    var dateCreated: Date
}

extension TaskDetail {
    init(taskDetailMO: TaskDetailMO) {
        self.id = taskDetailMO.id ?? UUID().uuidString
        self.title = taskDetailMO.title ?? ""
        self.description = taskDetailMO.taskDescription ?? ""
        self.checkList = (taskDetailMO.checkListRelation?.allObjects as? [CheckListItemMO])?.map {
            return CheckListItem(checkListItemMO: $0)
        } ?? []
        self.dateCreated = taskDetailMO.dateCreated ?? Date.now
    }
}

extension CheckListItem {
    init(checkListItemMO: CheckListItemMO) {
        self.id = checkListItemMO.id ?? UUID().uuidString
        self.name = checkListItemMO.name ?? ""
        self.status = CheckListItemStatus(rawValue: checkListItemMO.status) ?? .pending
        self.dateCreated = checkListItemMO.dateCreated ?? Date.now
    }
}

let sampleTask = TaskDetail(
    title: "Hello",
    description: "World",
    checkList: [
        CheckListItem(name: "Item 1", status: .pending, dateCreated: Date.now),
        CheckListItem(name: "Item 2", status: .complete, dateCreated: Date.now),
        CheckListItem(name: "Item 3", status: .cancelled, dateCreated: Date.now),
        CheckListItem(name: "Item 4", status: .pending, dateCreated: Date.now)
    ],
    dateCreated: Date.now
)

let sampleTaskList = [
    TaskDetail(
        title: "Hello1",
        description: "World1",
        checkList: [
            CheckListItem(name: "Item 1", status: .pending, dateCreated: Date.now),
            CheckListItem(name: "Item 2", status: .complete, dateCreated: Date.now),
            CheckListItem(name: "Item 3", status: .cancelled, dateCreated: Date.now),
            CheckListItem(name: "Item 4", status: .pending, dateCreated: Date.now)
        ],
        dateCreated: Date.now
    ),
    TaskDetail(
        title: "Hello2",
        description: "World2",
        checkList: [
            CheckListItem(name: "Item 1", status: .pending, dateCreated: Date.now),
            CheckListItem(name: "Item 2", status: .complete, dateCreated: Date.now),
            CheckListItem(name: "Item 3", status: .cancelled, dateCreated: Date.now),
            CheckListItem(name: "Item 4", status: .pending, dateCreated: Date.now)
        ],
        dateCreated: Date.now
    ),
    TaskDetail(
        title: "Hello3",
        description: "World3",
        checkList: [
            CheckListItem(name: "Item 1", status: .pending, dateCreated: Date.now),
            CheckListItem(name: "Item 2", status: .complete, dateCreated: Date.now),
            CheckListItem(name: "Item 3", status: .cancelled, dateCreated: Date.now),
            CheckListItem(name: "Item 4", status: .pending, dateCreated: Date.now)
        ],
        dateCreated: Date.now
    ),
    TaskDetail(
        title: "Hello4",
        description: "World4",
        checkList: [
            CheckListItem(name: "Item 1", status: .pending, dateCreated: Date.now),
            CheckListItem(name: "Item 2", status: .complete, dateCreated: Date.now),
            CheckListItem(name: "Item 3", status: .cancelled, dateCreated: Date.now),
            CheckListItem(name: "Item 4", status: .pending, dateCreated: Date.now)
        ],
        dateCreated: Date.now
    ),
    TaskDetail(
        title: "Hello5",
        description: "World5",
        checkList: [
            CheckListItem(name: "Item 1", status: .pending, dateCreated: Date.now),
            CheckListItem(name: "Item 2", status: .complete, dateCreated: Date.now),
            CheckListItem(name: "Item 3", status: .cancelled, dateCreated: Date.now),
            CheckListItem(name: "Item 4", status: .pending, dateCreated: Date.now)
        ],
        dateCreated: Date.now
    ),
    TaskDetail(
        title: "Hello6",
        description: "World6",
        checkList: [
            CheckListItem(name: "Item 1", status: .pending, dateCreated: Date.now),
            CheckListItem(name: "Item 2", status: .complete, dateCreated: Date.now),
            CheckListItem(name: "Item 3", status: .cancelled, dateCreated: Date.now),
            CheckListItem(name: "Item 4", status: .pending, dateCreated: Date.now)
        ],
        dateCreated: Date.now
    )
]
