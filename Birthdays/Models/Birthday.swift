//
//  BirthdayData.swift
//  Birthdays
//
//  Created by Moorthy, Prashanth on 01/03/22.
//

import Foundation

struct Birthday : Persistable {
    var id: UUID = UUID()
    let name : String
    let birthDay : Date
    var isFavorite: Bool

    init(name: String, birthDay: Date, isFavorite: Bool = false) {
        self.name = name
        self.birthDay = birthDay
        self.isFavorite = isFavorite
    }

}
