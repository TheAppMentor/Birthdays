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

class SomeClass: ObservableObject {

}

struct AddBirthdayForm: View {
    @State var userName: String
    @State var birthDate: Date
    @State var isFavorite: Bool

    var isValidForm: Bool {
        return !userName.isEmpty && birthDate != Date.distantPast
    }



    @State private var didUserSelectDate = false

//    func validateForm() -> Result<Bool,FormValidationError> {
//        if isValidName() && isValidDate() {
//            return .success(true)
//        }
//
//        if !isValidDate() {
//            return .failure(.invalidDate)
//        }
//
//        return .failure(.invalidName)
//    }

    var body: some View {

        Form {
            Section(header: Text("Preview")) {
                ListItemView(listItem: BirthdayItem(birthDayModel:
                                                        Birthday(
                                                            name: userName.isEmpty ? " " : userName,
                                                            birthDay:birthDate,
                                                            isFavorite: isFavorite)))
            }

            Section(header: Text("Name")) {
                TextField("Name",
                          text: $userName,
                          prompt: Text("Name goes here"))
            }.listRowBackground(Color(white: 0.9))


            Section(header: Text("Birthday")) {
                DatePicker("Date of Birth", selection: $birthDate,
                           in:  Date(timeIntervalSince1970: 0)...Date(),
                           displayedComponents: [.date])
                .datePickerStyle(.compact)
                .onChange(of: birthDate) { newValue in
                    didUserSelectDate = true
                }
            }.listRowBackground(Color(white: 0.9))


            Section {
                HStack {
                    Toggle(isOn: $isFavorite) {
                        Text("Favorite")
                    }
                }
            }
//            Section {
//                HStack {
//                Spacer()
//
//                    Button {
//                        // handle tap on button
//                    } label: {
//                        Text("Add Birthday")
//                    }
//
//                Spacer()
//                //.disabled(userName.count < 3 || !didUserSelectDate)
//            }
//            }
        }
    }
}

struct AddBirthdayForm_Previews: PreviewProvider {
    static var previews: some View {
        AddBirthdayForm(userName: "",birthDate: Date.init(timeIntervalSince1970: 0), isFavorite: true)
    }
}
