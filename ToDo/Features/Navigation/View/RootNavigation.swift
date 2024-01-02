//
//  RootNavigation.swift
//  ToDo
//
//  Created by deq on 25/12/23.
//

import SwiftUI

struct RootNavigation: View {
    var body: some View {
        NavigationView {
            DashboardView()
                .navigationTitle("Dashboard")
        }
    }
}

struct RootNavigation_Previews: PreviewProvider {
    static var previews: some View {
        RootNavigation()
    }
}
