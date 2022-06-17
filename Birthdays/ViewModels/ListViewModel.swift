//
//  ListViewModel.swift
//  Birthdays
//
//  Created by Moorthy, Prashanth on 30/03/22.
//

import Foundation

protocol ListItemModel {
}

protocol ListItemViewModelProtocol: Identifiable, ObservableObject {
    var id: UUID { get }
    var title: String { get }
    var subTitle: String { get }
    var isFavorite: Bool { get }
}

protocol ListSection : Identifiable {
    associatedtype ListItemType: ListItemViewModelProtocol
    var header : String { get }
    var items: [ListItemType] { get }
}

protocol ListViewModel : ObservableObject,Identifiable {
    associatedtype Sec : ListSection
    associatedtype P : PersistenceManager

    var sections : [Sec] { get }
    var title : String { get }
    var persistenceManager : P { get }
    
    func addEntity(item: [String:Any])
}
