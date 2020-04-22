//
//  CoreDataStack.swift
//  OrganizeItAll
//
//  Created by MOYA RICHARDS on 3/12/20.
//  Copyright © 2020 MOYA RICHARDS. All rights reserved.
//

import Foundation
import CoreData


// MARK: - Core Data stack

class CoreDataStack {
    var container: NSPersistentContainer {
        let container = NSPersistentContainer(name: "OrganizeItAll")
        container.loadPersistentStores { (description, error) in
            guard error == nil else {
                print("Error: \(error!)")
                return
            }
        }
        
        return container
    }

    var managedContext: NSManagedObjectContext {
        return container.viewContext
    }
}
