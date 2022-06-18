//
//  AddItemSheetView.swift
//  Birthdays
//
//  Created by Moorthy, Prashanth on 22/02/22.
//

import SwiftUI

class BirthDayEntry: ObservableObject {
    @Published var name: String
    var birthDate: Date
    var isFavorite: Bool

    internal init(name: String, birthDate: Date, isFavorite: Bool = false) {
        self.name = name
        self.birthDate = birthDate
        self.isFavorite = isFavorite
    }
}

struct AddItemSheetView: View {
    
    @Environment(\.dismiss) var dismiss

    @StateObject var tempBirthDay = BirthDayEntry(name: "", birthDate: Date())
    
    let onAdd : (_ userInput : [String: Any]) -> ()
       
    var body: some View {
        NavigationView {
            VStack {
                AddBirthdayForm(birthDayEntry: tempBirthDay)
                .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("New Birthday")
                    .toolbar {
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                            Button("Cancel") {
                                dismiss()
                            }
                        }

                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                            Button("Add") {
                                onAdd(["userName": tempBirthDay.name, "birthday": tempBirthDay.birthDate])
                                dismiss()
                            }.disabled(tempBirthDay.name.isEmpty)
                        }
                }
            }
        }

    }
}

struct AddItemSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemSheetView { userInput in
            print("OK.. User Input was \(userInput)")
        }
    }
}
