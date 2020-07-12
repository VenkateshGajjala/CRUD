//
//  ContactDetailsModel.swift
//  PhableAssignment
//
//  Created by Venkatesh on 12/07/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import Foundation
import RealmSwift

class ContactDetails: Object {
    @objc dynamic var firstName:String?
    @objc dynamic var lastName:String?
    @objc dynamic var mobileNumber:String?
    convenience init(firstName:String?,lastName:String?,mobileNumber:String?) {
        self.init()
        self.firstName = firstName
        self.lastName = lastName
        self.mobileNumber = mobileNumber
    }

}
