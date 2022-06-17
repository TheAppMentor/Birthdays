//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Moorthy, Prashanth on 21/02/22.
//

import SwiftUI

//let contactsLVM = ContactListViewModel()

let birthdaysVM = BirthdayListViewModel(title: "Birthdays", persistenceManager: BDayArrayPersistenceManager())

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            CustomListView(listViewModel: birthdaysVM)
        }
    }
}
