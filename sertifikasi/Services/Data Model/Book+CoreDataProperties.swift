//
//  Book+CoreDataProperties.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var author: String?
    @NSManaged public var delete: Bool
    @NSManaged public var id: String?
    @NSManaged public var publisher: String?
    @NSManaged public var status: Int16
    @NSManaged public var title: String?
    @NSManaged public var transactions: NSSet?

}

// MARK: Generated accessors for transactions
extension Book {

    @objc(addTransactionsObject:)
    @NSManaged public func addToTransactions(_ value: TransactionDetail)

    @objc(removeTransactionsObject:)
    @NSManaged public func removeFromTransactions(_ value: TransactionDetail)

    @objc(addTransactions:)
    @NSManaged public func addToTransactions(_ values: NSSet)

    @objc(removeTransactions:)
    @NSManaged public func removeFromTransactions(_ values: NSSet)

}

extension Book : Identifiable {
    var wrappedStatus : BookStatus {
        get {
            return BookStatus(rawValue: self.status)!
        }
        set {
            self.status = newValue.rawValue
        }
    }
    
    var wrappedTitle : String {
        return title ?? "No Title Available"
    }
    
    var wrappedAuthor : String {
        return author ?? "No Author Available"
    }
    
    var wrappedPublisher : String {
        return publisher ?? "No Publisher Recorded"
    }
}
