//
//  TransactionDetailView.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 19/12/22.
//

import SwiftUI

struct TransactionDetailView: View {
    
    @StateObject var viewModel = TransactionDetailViewModel()
    var transactionID : String
    
    var body: some View {
        VStack {
            Form {
                Section (header: Text("Borrow Date")
                    .foregroundColor(Color.blue)
                    .bold()
                ){
                    TextField("", text: $viewModel.borrowDate)
                        .disabled(true)
                        .padding(.all, 7.0)
                        .foregroundColor(Color.black)
                    //                            .padding(.horizontal)
                }
                
                Section (header: Text("Returned Date")
                    .foregroundColor(Color.blue)
                    .bold()
                ){
                    TextField("Not Returned Yet", text: $viewModel.returnedDate)
                        .disabled(true)
                        .padding(.all, 7.0)
                        .foregroundColor(Color.black)
                    //                            .padding(.horizontal)
                }
                Section (header: Text("Book Title")
                    .foregroundColor(Color.blue)
                    .bold()
                ){
                    TextField("Book Title", text: $viewModel.bookTitle)
                        .disabled(true)
                        .padding(.all, 7.0)
                        .foregroundColor(Color.black)
                    //                            .padding(.horizontal)
                }
                
                if GlobalObject.shared.user?.wrappedRole == .admin {
                    Section (header: Text("Borrower")
                        .foregroundColor(Color.blue)
                        .bold()
                    ){
                        TextField("Borrower", text: $viewModel.borrower)
                            .disabled(true)
                            .padding(.all, 7.0)
                            .foregroundColor(Color.black)
                        //                            .padding(.horizontal)
                    }
                }
                
            }
            if GlobalObject.shared.user != nil {
                if GlobalObject.shared.user!.wrappedRole == .member {
                    Button("Return Book") {
                        viewModel.returnBook()
                    }
                }
            }
        }
        .onAppear(){
            viewModel.setup(transactionID: transactionID)
        }
    }
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailView(transactionID: UUID().uuidString)
    }
}
