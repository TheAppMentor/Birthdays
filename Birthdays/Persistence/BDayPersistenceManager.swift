//
//  BDayPersistenceManager.swift
//  Birthdays
//
//  Created by Moorthy, Prashanth on 02/04/22.
//

import Foundation

var birthdayStore = [
    Birthday(name: "Prashanth", birthDay: Date()),
    Birthday(name: "Sheia", birthDay: Date(), isFavorite: true)
]

class BDayArrayPersistenceManager: PersistenceManager {
    
    @Published var allItems: [Birthday] = []
    
    init() {
        fetchBirthdays()
    }
    
    func fetchBirthdays() {
        guard let allBirthdays = fetchAll() as? [Birthday] else {
            fatalError()
        }
        
        allItems = allBirthdays
    }
    
    func fetchAll() -> [Persistable] {
        return birthdayStore as [Persistable]
    }
    
    func add(entity : Persistable) {
        birthdayStore.append(entity as! Birthday)
        fetchBirthdays()
    }
    
    func delete(entityID: UUID) {
        assertionFailure("Delete not implemented")
    }
}
