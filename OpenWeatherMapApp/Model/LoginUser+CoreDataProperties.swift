//
//  LoginUser+CoreDataProperties.swift
//  OpenWeatherMapApp
//
//  Created by AssetTelematics Pvt Ltd on 6/21/21.
//  Copyright © 2021 Asset Telematics. All rights reserved.
//
//

import Foundation
import CoreData


extension LoginUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LoginUser> {
        return NSFetchRequest<LoginUser>(entityName: "LoginUser")
    }

    @NSManaged public var userId: String?
    @NSManaged public var password: String?
    @NSManaged public var userData: NSSet?

}

// MARK: Generated accessors for userData
extension LoginUser {

    @objc(addUserDataObject:)
    @NSManaged public func addToUserData(_ value: UserData)

    @objc(removeUserDataObject:)
    @NSManaged public func removeFromUserData(_ value: UserData)

    @objc(addUserData:)
    @NSManaged public func addToUserData(_ values: NSSet)

    @objc(removeUserData:)
    @NSManaged public func removeFromUserData(_ values: NSSet)

}
