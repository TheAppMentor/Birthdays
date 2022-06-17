//
//  ContactListViewModel.swift
//  Birthdays
//
//  Created by Moorthy, Prashanth on 30/03/22.
//

import Foundation

class ContactListViewModel : ListViewModel {
    func addEntity(item: [String:Any]) {

    }

    let id: UUID = UUID()

    var title:String = "Contacts"
    var persistenceManager = ContactPersistenceManager()
    var sections: [ContactsListItemSection] = []
    
    init() {
        let allContacts = persistenceManager.fetchAll() as! [Contact]
        sections = buildSections(contacts: allContacts)
    }
    
    func buildSections(contacts : [Contact]) -> [ContactsListItemSection] {
        return contacts.map { ContactsListItemSection(header: "Contacts", items: [ContactItem(title: $0.firstName, subTitle: $0.lastName)])
        }
    }
}

class ContactsListItemSection: ListSection {
    typealias T = ContactItem
    var id: UUID = UUID()
    var items: [T]
    var header: String
    
    init(header: String, items: [T]) {
        self.items = items
        self.header = header
    }
    
}

class ContactItem: ListItemViewModelProtocol {
    var id: UUID = UUID()
    var title: String
    var subTitle: String
    var isFavorite: Bool = false
    
    init(title: String, subTitle: String) {
        self.title = title
        self.subTitle = subTitle
    }
}
