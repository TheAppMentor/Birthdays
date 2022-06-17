//
//  AddItemSheetView.swift
//  Birthdays
//
//  Created by Moorthy, Prashanth on 22/02/22.
//

import SwiftUI

struct AddItemSheetView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var userName = ""
    @State var selectedDate = Date()
    
    let onAdd : (_ userInput : [String: Any]) -> ()
       
    var body: some View {
        NavigationView {


            VStack {
//                HStack() {
//                    Spacer()
//                    VStack {
//                        Image(systemName: "person.circle.fill")
//                            .antialiased(true) //for smooth edges for scale to fill
//                            .resizable() // for resizing
//                            .frame(width: 70, height: 70, alignment: .center)
//                            .scaledToFill() // for filling image on ImageView
//                            .foregroundColor(.brown)
//                        Text("Foo")
//                        Text("Foo")
//                        Spacer()
//                    }
//                    Spacer()
//                }
//                .padding()
//                .background(.gray)

                AddBirthdayForm(userName: "", birthDate: Date(), isFavorite: false)
                .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Add")
                    .toolbar {
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                            Button("Cancel") {
                                dismiss()
                            }
                        }

                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                            Button("Add") {
                                onAdd(["userName": userName, "birthday": selectedDate])
                                //viewModel.addEntity(item: ["userName": userName, "birthday": selectedDate])
                                //sharedPersistenceManager.add(entity: BirthdayItem(birthDayModel: BirthdayModel(name: userName, birthDay: selectedDate)))
                                dismiss()
                            }.disabled(userName.isEmpty)
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
