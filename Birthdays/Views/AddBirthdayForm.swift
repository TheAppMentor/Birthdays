//
//  AddBirthdayForm.swift
//  Birthdays
//
//  Created by Moorthy, Prashanth on 16/06/22.
//

import SwiftUI

enum FormValidationError : Error {
    case invalidName
    case invalidDate
}

enum FocusField {
    case nameField
}

struct AddBirthdayForm: View {

    @ObservedObject var birthDayEntry: BirthDayEntry

    @State private var didUserSelectDate = false

    @FocusState var currentlyFocussedField: Bool

    var body: some View {

        Form {
            Section(header: Text("Name")) {
                TextField("Name",
                          text: $birthDayEntry.name,
                          prompt: Text("Name goes here"))
                .focused($currentlyFocussedField)
            }
            
            Section(header: Text("Birthday")) {
                DatePicker("Date of Birth", selection: $birthDayEntry.birthDate,
                           in:  Date(timeIntervalSince1970: 0)...Date(),
                           displayedComponents: [.date])
                .datePickerStyle(.compact)
                .onChange(of: birthDayEntry.birthDate) { newValue in
                    didUserSelectDate = true
                }
            }

            Section {
                HStack {
                    Toggle(isOn: $birthDayEntry.isFavorite) {
                        Text("Favorite")
                    }
                }
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                currentlyFocussedField = true
            }
        }
    }
}

struct AddBirthdayForm_Previews: PreviewProvider {
    static var previews: some View {
        AddBirthdayForm(birthDayEntry: BirthDayEntry(name: "Test1", birthDate: Date()))
    }
}
