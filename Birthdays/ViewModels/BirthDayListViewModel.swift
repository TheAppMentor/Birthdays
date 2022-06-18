//
//  BirthDayListViewModel.swift
//  Birthdays
//
//  Created by Moorthy, Prashanth on 21/02/22.
//

import Foundation
import SwiftUI

class BirthdayItem : ListItemViewModelProtocol {
    let id: UUID
    let title: String
    let subTitle: String
    let isFavorite: Bool

    init(birthDayModel: Birthday) {
        id = UUID()
        title = birthDayModel.name
        subTitle = birthDayModel.birthDay.toLongString()
        isFavorite = birthDayModel.isFavorite
    }
}

class BirthdayItemsSection : ListSection {
    var header: String = ""
    typealias T = BirthdayItem
    var id: UUID = UUID()
    var items: [BirthdayItem] = []
    
    init(header: String, id: UUID, items: [T]) {
        self.header = header
        self.id = id
        self.items = items
    }

}

class BirthdayListViewModel<P: PersistenceManager> : ListViewModel {

    var id: UUID = UUID()
    var title: String
    var persistenceManager: P
    @Published var sections: [BirthdayItemsSection] = []
    
    init(title: String, persistenceManager: P) {
        self.title = title
        self.persistenceManager = persistenceManager
        
        sections = buildSection(allModelObjects: persistenceManager.fetchAll() as! [Birthday])
    }
    
    func addEntity(item: [String:Any]) {
        print("View Model : I will now add some Entity : \(item)")
        
        guard let userName = item["userName"] as? String,
              let birthdayDate = item["birthday"] as? Date else {
                 return
              }
        
        let bdayEntry = Birthday(name: userName, birthDay: birthdayDate)
        persistenceManager.add(entity: bdayEntry)
        populateSections()
    }
}

extension BirthdayListViewModel {
    
    func populateSections() {
        let allModelObjects = persistenceManager.fetchAll() as! [Birthday]
        sections = buildSection(allModelObjects: allModelObjects)
    }
    
    func buildSection(allModelObjects: [Birthday]) -> [BirthdayItemsSection] {
        
        var pastBirthDays : [BirthdayItem] = []
        var isToday : [BirthdayItem] = []
        var thisMonthBirthDays : [BirthdayItem] = []
        var nextMonthBirthDays: [BirthdayItem] = []
        var laterThisYearBirthDays: [BirthdayItem] = []
        
        allModelObjects.forEach {
            
            let birthDayVM = BirthdayItem(birthDayModel: $0)
            
            if $0.birthDay.isInToday {
                isToday.append(birthDayVM)
                return
            }
            
            if $0.birthDay.isInThePast {
                pastBirthDays.append(birthDayVM)
                return
            }
            
            if $0.birthDay.isInThisMonth {
                thisMonthBirthDays.append(birthDayVM)
                return
            }
            
            if $0.birthDay.isInNextMonth {
                nextMonthBirthDays.append(birthDayVM)
                return
            }
            
            laterThisYearBirthDays.append(birthDayVM)
        }
        
        return [
            BirthdayItemsSection(header: "Today", id: UUID(), items: isToday),
            BirthdayItemsSection(header: "This Month", id: UUID(), items: thisMonthBirthDays),
            BirthdayItemsSection(header: "Next Month", id: UUID(), items: nextMonthBirthDays),
            BirthdayItemsSection(header: "Later this year", id: UUID(), items: laterThisYearBirthDays),
        ]
    }
}



