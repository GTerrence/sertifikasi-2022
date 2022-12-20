//
//  Transaction+CoreDataProperties.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var delete: Bool
    @NSManaged public var id: String?
    @NSManaged public var transaction_finished: Date?
    @NSManaged public var book_id: String?
    @NSManaged public var transaction_date: Date?
    @NSManaged public var user_id: String?
    @NSManaged public var books: NSSet?
    @NSManaged public var member: Member?
    @NSManaged public var user: User?

}

// MARK: Generated accessors for books
extension Transaction {

    @objc(addBooksObject:)
    @NSManaged public func addToBooks(_ value: TransactionDetail)

    @objc(removeBooksObject:)
    @NSManaged public func removeFromBooks(_ value: TransactionDetail)

    @objc(addBooks:)
    @NSManaged public func addToBooks(_ values: NSSet)

    @objc(removeBooks:)
    @NSManaged public func removeFromBooks(_ values: NSSet)

}

extension Transaction : Identifiable {
    var wrappedBookID : String {
        return book_id ?? ""
    }
    
    var wrappedTransactionDate : Date {
        return transaction_date ?? Date()
    }
    
    
    var wrappedStartDate : String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        return formatter.string(from: transaction_date ?? Date())
    }
    
    enum TransactionStatus : String {
        case onGoing = "On Going"
        case ended = "Ended"
        case overdue = "Overdue"
    }
    
    var transactionStatus : TransactionStatus {
        let diffSeconds = wrappedTransactionDate.timeIntervalSinceReferenceDate - Date().timeIntervalSinceReferenceDate
        let diffDays = Int(diffSeconds / (60.0 * 60.0 * 24.0))
        
        if transaction_finished != nil {
            return .ended
        }
        if diffDays >= -7 {
            return .onGoing
        }
        return .overdue
    }
}
