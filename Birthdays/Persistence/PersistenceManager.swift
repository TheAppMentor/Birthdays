//
//  PersistenceManager.swift
//  Birthdays
//
//  Created by Moorthy, Prashanth on 21/02/22.
//

import Foundation

protocol Persistable {
    var id : UUID { get }
}

protocol PersistenceManager : ObservableObject {
    func fetchAll() -> [Persistable]
    func add(entity: Persistable)
    func delete(entityID: UUID)
}
