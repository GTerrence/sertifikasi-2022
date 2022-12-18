//
//  HomeView.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        displayView()
        
//        Button("Add dummy data") {
//            let user = User(context: CoreDataController.controller.context)
//            let userID = UUID().uuidString
//            user.id = userID
//            user.name = "James"
//            user.password = "123456"
//            user.role = "admin"
//            user.delete = false
//
//            let member = Member(context: CoreDataController.controller.context)
//            let memberID = UUID().uuidString
//            member.id = memberID
//            member.name = "Albert"
//            member.start_date = Date()
//            member.delete = false
//
//            let book = Book(context: CoreDataController.controller.context)
//            let bookID = UUID().uuidString
//            book.id = bookID
//            book.title = "Now You See Me"
//            book.author = "Isabella Ridge"
//            book.wrappedStatus = .available
//            book.published_date = Date()
//            book.publisher = "Columbia"
//            book.delete = false
//
//            let transaction = Transaction(context: CoreDataController.controller.context)
//            let transactionID = UUID().uuidString
//            transaction.id = transactionID
//            transaction.user_id = userID
//            transaction.member_id = memberID
//            transaction.transaction_date = Date()
//            transaction.is_finished = false
//            transaction.delete = false
//
//            let detail = TransactionDetail(context: CoreDataController.controller.context)
//            detail.transaction_id = transactionID
//            detail.book_id = bookID
//            detail.delete = false
//
//            CoreDataController.controller.save()
//        }
    }
    
    func displayView() -> some View {
        return LoginView()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
