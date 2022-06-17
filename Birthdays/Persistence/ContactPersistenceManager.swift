//
//  ContactPersistenceManager.swift
//  Birthdays
//
//  Created by Moorthy, Prashanth on 03/04/22.
//

import Foundation



class ContactPersistenceManager : PersistenceManager {
    
    @Published var allItems: [Contact] = []
    
    init() {
        let allContacts = fetchAll()
        allItems = allContacts as! [Contact]
    }

    func fetchAll() -> [Persistable] {
        let encodedObject = try! NSKeyedArchiver.archivedData(withRootObject: Contact(firstName: "What Ra", lastName: "last"), requiringSecureCoding: false)
        UserDefaults.standard.set(encodedObject, forKey: "contacts")
        
        let fetchedObj = UserDefaults.standard.object(forKey: "contacts")
        let allContacts = try! NSKeyedUnarchiver.unarchivedObject(ofClass: Contact.self, from: fetchedObj as! Data)
        return [allContacts! as Persistable]
        
    }
    
    func add(entity: Persistable) {
        
    }
    
    func delete(entityID: UUID) {
        
    }
    
    
}
