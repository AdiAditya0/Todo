//
//  RootNavigation.swift
//  ToDo
//
//  Created by deq on 25/12/23.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

struct RootNavigation: View {
    
    var body: some View {
        NavigationStack {
            DashboardView(viewModel: DashboardViewModel())
                .navigationTitle("Dashboard")
                .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct RootNavigation_Previews: PreviewProvider {
    static var previews: some View {
        RootNavigation()
    }
}
