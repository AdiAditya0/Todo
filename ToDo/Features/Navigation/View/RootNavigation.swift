//
//  RootNavigation.swift
//  ToDo
//
//  Created by deq on 25/12/23.
//

import SwiftUI

struct RootNavigation: View {
    var dashboardViewModel = DashboardViewModel()
    var body: some View {
        NavigationView {
            DashboardView(viewModel: dashboardViewModel)
                .navigationTitle("Dashboard")
        }
    }
}

struct RootNavigation_Previews: PreviewProvider {
    static var previews: some View {
        RootNavigation()
    }
}
