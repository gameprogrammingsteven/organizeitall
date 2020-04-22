//
//  Task+CoreDataProperties.swift
//  OrganizeItAll
//
//  Created by MOYA RICHARDS on 3/15/20.
//  Copyright © 2020 MOYA RICHARDS. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var created_date: Date?
    @NSManaged public var detail: String
    @NSManaged public var isComplete: Bool
    @NSManaged public var modified_date: Date?
    @NSManaged public var title: String
    @NSManaged public var list: List?

}
