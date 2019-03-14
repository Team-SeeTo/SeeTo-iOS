//
//  CoreData.swift
//  SeeTo_IOS
//
//  Created by 조우진 on 14/03/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreData {
    var object : NSManagedObject!
    var managedContext : NSManagedObjectContext!
    
    init(entityName : String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        managedContext = appDelegate.persistentContainer.viewContext
        let Entity = NSEntityDescription.entity(forEntityName: entityName, in: managedContext)
        object = NSManagedObject(entity: Entity!, insertInto: managedContext)
    }
    
    func set(value : Any, Key : String) {
        self.object.setValue(value, forKey: Key)
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
