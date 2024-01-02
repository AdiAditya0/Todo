//
//  DashboardView.swift
//  ToDo
//
//  Created by deq on 25/12/23.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        List(sampleTaskList, id: \.id) { item in
            DashboardCell(task: item)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
