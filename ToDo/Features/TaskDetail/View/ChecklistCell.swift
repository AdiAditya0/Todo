//
//  ChecklistCell.swift
//  ToDo
//
//  Created by deq on 27/12/23.
//

import SwiftUI

struct ChecklistCell: View {
    let item: CheckListItem
    
    func getBackgroundColor() -> Color {
        switch item.status {
        case .pending:
            return Color.orange
        case .complete:
            return Color.green
        case .cancelled:
            return Color.red
        }
    }
    
    var body: some View {
        Text(item.name)
            .padding(5)
            .cornerRadius(8)
            .listRowBackground(getBackgroundColor())
            .strikethrough(item.status == .cancelled)
    }
}

struct ChecklistCell_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistCell(item: CheckListItem(name: "Hello", status: .pending))
    }
}
