//
//  TransactionViewModel.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 19/12/22.
//

import Foundation

class TransactionViewModel : ObservableObject {
    @Published var transactionCollection = TransactionCollection()
    
    func setup() {
        transactionCollection.getNewTransactions()
    }
    
    // delete plan
    func onDelete(offset: IndexSet) {
        guard let transaction = offset.map { transactionCollection.transactionList[$0] }.first as? Transaction else {
            print("not a transaction")
            return
        }
        transaction.delete = true
        CoreDataController.controller.save()
    }
    
    // Gerakin plan ketika edit
    func onMove(source: IndexSet, destination: Int){
        transactionCollection.transactionList.move(fromOffsets: source, toOffset: destination)
    }
    
}
