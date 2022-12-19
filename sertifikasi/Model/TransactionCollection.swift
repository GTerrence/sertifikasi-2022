//
//  TransactionCollection.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 19/12/22.
//

import Foundation

struct TransactionCollection {
    
    var transactionList : [Transaction] = []
    
    mutating func getNewTransactions() {
        guard let transactions = CoreDataController.controller.selectOneWhereCoreData(entityName: "Transaction", toPredicate: "delete", predicateValue: "false") as? [Transaction] else {
            print("No Transactions detected")
            return
        }
        self.transactionList = transactions
    }
}
