//
//  SettingsView.swift
//  Birthdays
//
//  Created by Moorthy, Prashanth on 22/02/22.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    @State var shouldNotify = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("")) {
                    Toggle("Notify Me", isOn: $shouldNotify)
                }
                
                Section {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0")
                    }
                    HStack {
                        Text("Author")
                        Spacer()
                        Text("CodeCraftBlog")
                    }
                }
                
            }
            .navigationTitle("Settings")
            .toolbar {
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
                
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
        
        SettingsView().colorScheme(.dark)
    
    }
}
