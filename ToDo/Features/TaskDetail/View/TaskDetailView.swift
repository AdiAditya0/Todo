//
//  TaskDetail.swift
//  ToDo
//
//  Created by deq on 27/12/23.
//

import SwiftUI

struct TaskDetailView<T: TaskDetailViewModelProtocol>: View {
    @ObservedObject private var viewModel: T
    @FocusState private var keyboardFocused
    
    init(viewModel: T) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Title")
                .font(.title3)
                .bold()
            TextField("Task Title", text: $viewModel.taskDetail.title)
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.black, lineWidth: 1)
                )
                .focused($keyboardFocused)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        keyboardFocused = true
                    }
                }
            
            Spacer(minLength: 20)
            Text("Description")
                .font(.title3)
                .bold()
            TextEditor(text: $viewModel.taskDetail.description)
                .padding(3)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.black, lineWidth: 1)
                ).frame(height: 100)
            
            Spacer(minLength: 20)
            Text("CheckList")
                .font(.title3)
                .bold()
            List(self.viewModel.taskDetail.checkList, id: \.id) { item in
                ChecklistCell(item: item)
            }
            
            Button("Add new Item") {
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity)
        }
        .padding(12)
        .navigationTitle("Task")
        .toolbar {
            if viewModel.isNewTask {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.createTask()
                    }
                }
            }
        }
    }
}

//struct TaskDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskDetailView(viewModel: TaskDetailViewModel(
//            taskDetail: sampleTask,
//            isNewTask: false)
//        )
//    }
//}
