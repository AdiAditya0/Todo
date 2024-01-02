//
//  TaskDetailViewModel.swift
//  ToDo
//
//  Created by deq on 27/12/23.
//

import SwiftUI

protocol TaskDetailViewModelProtocol: ObservableObject {
    var taskDetail: TaskDetail { get set }
    func createTask() -> Void
    func updateTaskDetails() -> Void
    func deleteTask() -> Void
}

class TaskDetailViewModel: TaskDetailViewModelProtocol {
    
    @Published var taskDetail: TaskDetail
    let isNewTask: Bool
    
    init(taskDetail: TaskDetail, isNewTask: Bool) {
        self.taskDetail = taskDetail
        self.isNewTask = isNewTask
    }
    
    deinit {
        print(">>>>>")
    }
    
    func createTask() { }
    
    func updateTaskDetails() { }
    
    func deleteTask() { }
}
