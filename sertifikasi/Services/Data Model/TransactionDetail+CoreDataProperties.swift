//
//  TransactionDetail+CoreDataProperties.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//
//

import Foundation
import CoreData


extension TransactionDetail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransactionDetail> {
        return NSFetchRequest<TransactionDetail>(entityName: "TransactionDetail")
    }

    @NSManaged public var book_id: String?
    @NSManaged public var delete: Bool
    @NSManaged public var transaction_id: String?
    @NSManaged public var book: Book?
    @NSManaged public var transaction: Transaction?

}

extension TransactionDetail : Identifiable {

}
