//
//  TransactionDetailViewModel.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 19/12/22.
//

import Foundation

class TransactionDetailViewModel : ObservableObject {
    @Published var bookTitle = ""
    @Published var borrowDate = ""
    @Published var returnedDate = ""
    @Published var borrower = ""
    
    private var formatter = DateFormatter()
    private var transactionID : String = ""
    
    func setup(transactionID : String) {
        guard let transaction = CoreDataController.controller.selectOneWhereCoreData(entityName: "Transaction", toPredicate: "id", predicateValue: "\(transactionID)").first as? Transaction else {
            print("No Transaction")
            return
        }
        self.transactionID = transactionID
        formatter.dateStyle = .short
        borrowDate = formatter.string(from: transaction.wrappedTransactionDate)
        if transaction.transaction_finished != nil {
            returnedDate = formatter.string(from: transaction.transaction_finished!)
        }
        
        if let book = CoreDataController.controller.selectOneWhereCoreData(entityName: "Book", toPredicate: "id", predicateValue: "\(transaction.wrappedBookID)").first as? Book {
            bookTitle = book.wrappedTitle
        }
        
        if GlobalObject.shared.user?.wrappedRole == .admin {
            if let user = CoreDataController.controller.selectOneWhereCoreData(entityName: "User", toPredicate: "id", predicateValue: transaction.user_id ?? "").first as? User {
                borrower = user.name ?? "Unknown Borrower"
            }
        }
    }
    
    func returnBook() {
        guard let transaction = CoreDataController.controller.selectOneWhereCoreData(entityName: "Transaction", toPredicate: "id", predicateValue: "\(transactionID)").first as? Transaction else {
            print("No Transaction")
            return
        }
        transaction.transaction_finished = Date()
        
        guard let book = CoreDataController.controller.selectOneWhereCoreData(entityName: "Book", toPredicate: "id", predicateValue: "\(transaction.wrappedBookID)").first as? Book else {
            print("No Book")
            return
        }
        
        book.wrappedStatus = .available
        
        CoreDataController.controller.save()
        
        setup(transactionID: self.transactionID)
    }
}
