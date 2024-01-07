//
//  RootNavigation.swift
//  ToDo
//
//  Created by deq on 25/12/23.
//

import SwiftUI

struct RootNavigation: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        NavigationView {
            DashboardView(viewModel: DashboardViewModel(context: managedObjectContext))
                .navigationTitle("Dashboard")
        }
    }
}

struct RootNavigation_Previews: PreviewProvider {
    static var previews: some View {
        RootNavigation()
    }
}
