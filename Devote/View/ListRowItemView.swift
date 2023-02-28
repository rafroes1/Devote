//
//  ListRowItemView.swift
//  Devote
//
//  Created by Rafael Carvalho on 28/02/23.
//

import SwiftUI

struct ListRowItemView: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? Color.pink : Color.primary)
                .padding(.vertical, 12)
        }//:TOGGLE
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange, perform: {
            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        })
    }
}
