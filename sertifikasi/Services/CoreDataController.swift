//
//  CoreDataController.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import Foundation
import CoreData

class CoreDataController {
    /// Get context for context to be used in this Controller.
    /// To get context, create PersistenceController class, then create NSPersistentCloudKitContainer with
    /// the parameter "name".
    /// Fill the name parameter with name of your CoreData file (not entity or attributes).
    /// After creating PersistenceController, call it in your @main app, then:
    ///  - Step 1: Create a variable (let prefered because its immutable) that holds the PersistenceController shared attribute. Ex: let persistence = PersistenceController.shared
    ///  - Step 2: At your body Scene, when you call your view, make sure to create an environment of your persistence's container viewContext attribute to get the context.
    ///  - Step 3: At your view that you want to use CoreData and CoreDataController, call an environmnet variable holding the context. Ex: @Environment(\.managedObjectContext) var context
    ///  - Step 4: Create a variable holding CoreDataController and pass context as parameter, then you can use the controller to access your core data.
    static let controller = CoreDataController()
    private let persistence = PersistenceController()
    
    var context: NSManagedObjectContext
    init() {
        self.context = persistence.container.viewContext
    }
    
    /// Select all data (all columns and rows) from the entity name passed
    ///
    /// - Parameters:
    ///   - entityName: the name of your entity (table in SQL)
    func selectAllCoreData(entityName: String) -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let result = try! context.fetch(fetchRequest) as! [NSManagedObject]
        return result
    }
    
    /// Select data from core data using only one conditional
    ///
    /// - Parameters:
    ///   - entityName: the name of your entity (table in SQL)
    ///   - toPredicate: the name of the column that you want to predicate (where in SQL)
    ///   - predicateValue: the name of the value that you want to find
    func selectOneWhereCoreData(entityName: String, toPredicate: String, predicateValue: String) -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let predicateCoreData = NSPredicate(format: "\(toPredicate) = %@", predicateValue)
        fetchRequest.predicate = predicateCoreData
        let result = try! context.fetch(fetchRequest) as! [NSManagedObject]

        return result
    }
    
    /// Select data from core data using more than one conditional with AND
    ///
    /// - Parameters:
    ///   - entityName: the name of your entity (table in SQL)
    ///   - toPredicate: multiple name of the column that you want to predicate (where in SQL)
    ///   - predicateValue: multiple name of the value that you want to find
    func selectMultipleWhereAndCoreData(entityName: String, toPredicate: [String], predicateValue: [String]) -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        var predicateCoreData: [NSPredicate] = []
        for index in 0...toPredicate.count-1 {
            predicateCoreData.append(NSPredicate(format: "\(toPredicate[index]) = %@", predicateValue[index]))
        }
        let predicateCompound = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: predicateCoreData)

        fetchRequest.predicate = predicateCompound
        let result = try! context.fetch(fetchRequest) as! [NSManagedObject]
        
        return result
    }

    /// Select data from core data using more than one conditional with OR
    ///
    /// - Parameters:
    ///   - entityName: the name of your entity (table in SQL)
    ///   - toPredicate: multiple name of the column that you want to predicate (where in SQL)
    ///   - predicateValue: multiple name of the value that you want to find
    func selectMultipleWhereOrCoreData(entityName: String, toPredicate: [String], predicateValue: [String]) -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        var predicateCoreData: [NSPredicate] = []
        for index in 0...toPredicate.count-1 {
            predicateCoreData.append(NSPredicate(format: "\(toPredicate[index]) = %@", predicateValue[index]))
        }
        let predicateCompound = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.or, subpredicates: predicateCoreData)

        fetchRequest.predicate = predicateCompound
        let result = try! context.fetch(fetchRequest) as! [NSManagedObject]
        
        return result
    }
    
    /// Delete data from core data with AND
    ///
    /// - Parameters:
    ///   - entityName: the name of your entity (table in SQL)
    ///   - toPredicate: multiple name of the column that you want to predicate (where in SQL)
    ///   - predicateValue: multiple name of the value that you want to find
    func deleteData(entityName: String, toPredicate: [String], predicateValue: [String]) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        var predicateCoreData: [NSPredicate] = []
        for index in 0...toPredicate.count-1 {
            predicateCoreData.append(NSPredicate(format: "\(toPredicate[index]) = %@", predicateValue[index]))
        }
        let predicateCompound = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: predicateCoreData)

        fetchRequest.predicate = predicateCompound
        let result = try! context.fetch(fetchRequest)
        for items in result {
            context.delete(items as! NSManagedObject)
        }
        
        do {
            try context.save()
        } catch {
            print("Failed to delete data")
        }
    }
    
    func save() {
        do {
            try context.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error \(error)")
        }
    }
}
