//
//  Notification+CoreDataProperties.swift
//  PFReminder
//
//  Created by py on 2018/7/26.
//  Copyright © 2018年 cn.py. All rights reserved.
//

import Foundation
import CoreData


extension Notification {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notification> {
        return NSFetchRequest<Notification>(entityName: "Notification")
    }

    @NSManaged public var id: String?
    @NSManaged public var date: String?
    @NSManaged public var title: String?
    @NSManaged public var body: String?

}
