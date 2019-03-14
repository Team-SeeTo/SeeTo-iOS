//
//  User+CoreDataProperties.swift
//  
//
//  Created by 조우진 on 14/03/2019.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var accessToken: String?
    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var refreshToken: String?

}
