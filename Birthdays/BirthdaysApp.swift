//
//  BirthdaysApp.swift
//  Birthdays

import SwiftUI

let birthdaysVM = BirthdayListViewModel(title: "Birthdays", persistenceManager: BDayArrayPersistenceManager())

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            SimpleListView(listViewModel: birthdaysVM)
        }
    }
}
