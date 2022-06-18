//
//  AddItemButton.swift
//  Birthdays
//
//  Created by Moorthy, Prashanth on 27/02/22.
//

import Foundation
import SwiftUI

struct AddItemButton: View {
    
    @State private var showingAddItemSheet = false

    var onSuccessAction : (_ userInput : [String:Any]) -> ()
    
    var body: some View {
        Button {
            showingAddItemSheet.toggle()
        } label: {
            Label("Add Item", systemImage: "person.crop.circle.fill.badge.plus")
                .foregroundColor(.primary)
        }.sheet(isPresented: $showingAddItemSheet) {
            AddItemSheetView { userInput in
                print("AddItem Button : User Entered Something man \(userInput)")
                onSuccessAction(userInput)
            }
        }
    }
}
