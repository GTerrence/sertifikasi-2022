//
//  User+CoreDataProperties.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var delete: Bool
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var role: String?
    @NSManaged public var transactions: NSSet?

}

// MARK: Generated accessors for transactions
extension User {

    @objc(addTransactionsObject:)
    @NSManaged public func addToTransactions(_ value: Transaction)

    @objc(removeTransactionsObject:)
    @NSManaged public func removeFromTransactions(_ value: Transaction)

    @objc(addTransactions:)
    @NSManaged public func addToTransactions(_ values: NSSet)

    @objc(removeTransactions:)
    @NSManaged public func removeFromTransactions(_ values: NSSet)

}

extension User : Identifiable {
    enum UserRole : String {
        case member = "member"
        case admin = "admin"
    }
    
    var wrappedRole : UserRole {
        get {
            return UserRole(rawValue: role!)!
        }
        set {
            self.role = newValue.rawValue
        }
    }
}
