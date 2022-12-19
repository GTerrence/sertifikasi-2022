//
//  TransactionView.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 19/12/22.
//

import SwiftUI

struct TransactionView: View {
    
    @StateObject var viewModel = TransactionViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(Array(viewModel.transactionCollection.transactionList.enumerated()), id: \.offset) { offset, item in
                    CardTransactionView(transactionID: item.id ?? "", transactionStatus: item.transactionStatus.rawValue, transactionDate: item.wrappedStartDate)
                    

                }
                .onDelete(perform: viewModel.onDelete)
                .onMove(perform: viewModel.onMove)
            }
            .listStyle(InsetListStyle())
        }
        .onAppear() {
            viewModel.transactionCollection.getNewTransactions()
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
