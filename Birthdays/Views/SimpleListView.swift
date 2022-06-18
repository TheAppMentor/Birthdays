//
//  ContentView.swift
//  Birthdays
//
//  Created by Moorthy, Prashanth on 21/02/22.
//

import SwiftUI

struct SimpleListView<LVM: ListViewModel>: View {
    
    var listViewModel: LVM
    
    var body: some View {
        NavigationView {
            CustomVStack<LVM>(listViewModel: listViewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let bVM = BirthdayListViewModel(title: "Bir", persistenceManager: BDayArrayPersistenceManager())

        SimpleListView(listViewModel : bVM)
            .environment(\.colorScheme, .dark)
    }
}

struct CustomVStack<LVM: ListViewModel>: View {
    
    @ObservedObject var listViewModel : LVM
    
    var body: some View {
        VStack {
            List {
                ForEach(listViewModel.sections) { section in
                    Section(header: Text(section.header)
                                .font(.subheadline)
                                .padding(.top,10)) {
                        
                        ForEach(section.items) {
                            ListItemView(listItem: $0)
                        }
                    }
                }
            }
            .navigationTitle(listViewModel.title)
            .toolbar {
                AddItemButton(onSuccessAction: { userInput in
                    listViewModel.addEntity(item: userInput)
                })
            }
        }
    }
}

struct ListItemView<T: ListItemViewModelProtocol>: View {
    
    var listItem: T
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .padding([.trailing])
                .foregroundColor(.teal);
            VStack(alignment: .leading) {
                Text(listItem.title).font(.headline)
                Text(listItem.subTitle).font(.subheadline).foregroundColor(.secondary)
            }
            Spacer()
                Image(systemName: "heart.fill")
                    .foregroundColor(.pink)
                    .opacity(listItem.isFavorite ? 1 : 0)
        }.padding(8)
    }
}
