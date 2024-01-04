//
//  DashboardView.swift
//  ToDo
//
//  Created by deq on 25/12/23.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel: DashboardViewModel
    
    var body: some View {
        List(viewModel.tasks, id: \.id) { item in
            DashboardCell(task: item)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(viewModel: DashboardViewModel())
    }
}
