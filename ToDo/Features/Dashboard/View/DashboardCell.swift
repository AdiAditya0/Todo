//
//  DashboardCell.swift
//  ToDo
//
//  Created by deq on 27/12/23.
//

import SwiftUI

struct DashboardCell: View {
    let task: TaskDetail
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        Text(task.title)
            .background {
                NavigationLink(
                    "",
                    destination: TaskDetailView(
                        viewModel: TaskDetailViewModel(
                            context: managedObjectContext,
                            taskDetail: task,
                            isNewTask: false)
                    )
                )
                .opacity(0)
            }
    }
}

//struct DashboardCell_Previews: PreviewProvider {
//    static var previews: some View {
//        DashboardCell(task: sampleTask)
//    }
//}
