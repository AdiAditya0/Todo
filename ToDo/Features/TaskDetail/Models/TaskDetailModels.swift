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

//struct CheckListItem: Codable, Identifiable {
//    var id = UUID()
//    let name: String
//    let status: CheckListItemStatus
//}

//struct TaskDetail: Codable, Identifiable {
//    var id = UUID()
//    var title: String
//    var description: String
//    var checkList: [CheckListItem]
//}

//let sampleTask = TaskDetail(
//    title: "Hello",
//    description: "World",
//    checkList: [
//        CheckListItem(name: "Item 1", status: .pending),
//        CheckListItem(name: "Item 2", status: .complete),
//        CheckListItem(name: "Item 3", status: .cancelled),
//        CheckListItem(name: "Item 4", status: .pending)
//    ]
//)

//let sampleTaskList = [
//    TaskDetail(
//        title: "Hello1",
//        description: "World1",
//        checkList: [
//            CheckListItem(name: "Item 1", status: .pending),
//            CheckListItem(name: "Item 2", status: .complete),
//            CheckListItem(name: "Item 3", status: .cancelled),
//            CheckListItem(name: "Item 4", status: .pending)
//        ]
//    ),
//    TaskDetail(
//        title: "Hello2",
//        description: "World2",
//        checkList: [
//            CheckListItem(name: "Item 1", status: .pending),
//            CheckListItem(name: "Item 2", status: .complete),
//            CheckListItem(name: "Item 3", status: .cancelled),
//            CheckListItem(name: "Item 4", status: .pending)
//        ]
//    ),
//    TaskDetail(
//        title: "Hello3",
//        description: "World3",
//        checkList: [
//            CheckListItem(name: "Item 1", status: .pending),
//            CheckListItem(name: "Item 2", status: .complete),
//            CheckListItem(name: "Item 3", status: .cancelled),
//            CheckListItem(name: "Item 4", status: .pending)
//        ]
//    ),
//    TaskDetail(
//        title: "Hello4",
//        description: "World4",
//        checkList: [
//            CheckListItem(name: "Item 1", status: .pending),
//            CheckListItem(name: "Item 2", status: .complete),
//            CheckListItem(name: "Item 3", status: .cancelled),
//            CheckListItem(name: "Item 4", status: .pending)
//        ]
//    ),
//    TaskDetail(
//        title: "Hello5",
//        description: "World5",
//        checkList: [
//            CheckListItem(name: "Item 1", status: .pending),
//            CheckListItem(name: "Item 2", status: .complete),
//            CheckListItem(name: "Item 3", status: .cancelled),
//            CheckListItem(name: "Item 4", status: .pending)
//        ]
//    ),
//    TaskDetail(
//        title: "Hello6",
//        description: "World6",
//        checkList: [
//            CheckListItem(name: "Item 1", status: .pending),
//            CheckListItem(name: "Item 2", status: .complete),
//            CheckListItem(name: "Item 3", status: .cancelled),
//            CheckListItem(name: "Item 4", status: .pending)
//        ]
//    )
//]
