//
//  UserData+CoreDataProperties.swift
//  OpenWeatherMapApp
//
//  Created by AssetTelematics Pvt Ltd on 6/21/21.
//  Copyright © 2021 Asset Telematics. All rights reserved.
//
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var email: String?
    @NSManaged public var loginUser: LoginUser?

}
