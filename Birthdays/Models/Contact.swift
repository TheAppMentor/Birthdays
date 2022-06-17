//
//  Contact.swift
//  Birthdays
//
//  Created by Moorthy, Prashanth on 03/04/22.
//

import Foundation

class Contact : NSObject,Persistable,NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool {
        return true
    }
    
    func encode(with coder: NSCoder) {
        //coder.encode(id, forKey: "ID")
        coder.encode(firstName, forKey: "fName")
        coder.encode(lastName, forKey: "lName")
    }
    
    required init?(coder: NSCoder) {
        
        //id = coder.decodeObject(forKey: "ID") as? UUID ?? UUID()
        firstName = coder.decodeObject(forKey: "fName") as? String ?? ""
        lastName = coder.decodeObject(forKey: "lName") as? String ?? ""
    }
    
    var id: UUID = UUID()
    var firstName : String = ""
    var lastName : String = ""
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
