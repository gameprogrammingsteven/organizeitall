//
//  List+CoreDataProperties.swift
//  OrganizeItAll
//
//  Created by MOYA RICHARDS on 3/15/20.
//  Copyright © 2020 MOYA RICHARDS. All rights reserved.
//
//

import Foundation
import CoreData


extension List {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<List> {
        return NSFetchRequest<List>(entityName: "List")
    }

    @NSManaged public var created_date: Date?
    @NSManaged public var detail: String?
    @NSManaged public var modified_date: Date?
    @NSManaged public var name: String?
    @NSManaged public var listId: Int16
    @NSManaged public var isComplete: Bool
    @NSManaged public var task: NSSet?

}

// MARK: Generated accessors for task
extension List {

    @objc(addTaskObject:)
    @NSManaged public func addToTask(_ value: Task)

    @objc(removeTaskObject:)
    @NSManaged public func removeFromTask(_ value: Task)

    @objc(addTask:)
    @NSManaged public func addToTask(_ values: NSSet)

    @objc(removeTask:)
    @NSManaged public func removeFromTask(_ values: NSSet)

}
