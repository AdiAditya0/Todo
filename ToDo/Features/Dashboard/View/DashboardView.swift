//
//  DashboardView.swift
//  ToDo
//
//  Created by deq on 25/12/23.
//

import SwiftUI
import CoreData

struct DashboardView: View {
    @ObservedObject var viewModel: DashboardViewModel
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        ZStack {
            List(viewModel.tasks, id: \.id) { item in
                DashboardCell(task: item)
            }
            FloatingButton(icon: "plus", context: managedObjectContext)
        }
        .onAppear {
            viewModel.retrieveSavedTasks()
        }
    }
}

struct FloatingButton: View {
    let icon: String
    var context: NSManagedObjectContext
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                NavigationLink(
                    destination: TaskDetailView(
                        viewModel: TaskDetailViewModel(
                            context: context,
                            taskDetail: TaskDetail(
                                title: "",
                                description: "",
                                checkList: [],
                                dateCreated: Date.now),
                            isNewTask: true)
                    )
                ) {
                    Image(systemName: "plus")
                        .font(.title2.weight(.bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(.orange)
                        .clipShape(Circle())
                        .shadow(radius: 5, x: 0, y: 3)
                        .padding()
                }
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(viewModel: DashboardViewModel(context: NSManagedObjectContext()))
    }
}
