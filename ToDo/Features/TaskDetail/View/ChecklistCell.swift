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
        switch CheckListItemStatus(rawValue: item.status) {
        case .pending:
            return Color.orange
        case .complete:
            return Color.green
        case .cancelled:
            return Color.red
        default:
            return Color.white
        }
    }
    
    var body: some View {
        Text(item.name)
            .padding(5)
            .cornerRadius(8)
            .listRowBackground(getBackgroundColor())
            .strikethrough(CheckListItemStatus(rawValue: item.status) == .cancelled)
    }
}
