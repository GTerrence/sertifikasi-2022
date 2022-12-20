//
//  HomeView.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        TabView {
            CollectionView()
                .tabItem {
                    Label("Collection", systemImage: "list.dash")
                }
            TransactionView()
                .tabItem {
                    Label("Transaction", systemImage: "list.dash")
                }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                GlobalObject.shared.userID = ""
                GlobalObject.shared.user = nil
                self.mode.wrappedValue.dismiss()
            }, label: {
                Text("Logout")
            })
        )
        
        
//        Button("Add dummy data") {
////            let user = User(context: CoreDataController.controller.context)
////            user.id = UUID().uuidString
////            user.wrappedRole = .member
////            user.name = "Cath"
////            user.password = "123456"
////            user.delete = false
////
//            
//            guard let user = CoreDataController.controller.selectOneWhereCoreData(entityName: "User", toPredicate: "name", predicateValue: "Cath").first as? User else {
//                print("No user")
//                return
//            }
//            
//            guard let book = CoreDataController.controller.selectOneWhereCoreData(entityName: "Book", toPredicate: "title", predicateValue: "Harry Potter").first as? Book else {
//                print("No book")
//                return
//            }
//            
//            let transaction = Transaction(context: CoreDataController.controller.context)
//            transaction.id = UUID().uuidString
//            
//            transaction.user_id = user.id
//            transaction.book_id = book.id
//            
//            transaction.transaction_date = Calendar.current.date(byAdding: .weekOfYear, value: -2, to: Date())
//            transaction.delete = false
//            
//            book.wrappedStatus = .borrowed
//            CoreDataController.controller.save()
//        }
//                    let books = CoreDataController.controller.selectAllCoreData(entityName: "Book") as! [Book]
//                    let book = books.filter({$0.id == nil}).first!
//                    book.id = UUID().uuidString
//                    book.title = "The Immortals"
//                    book.author = "Unknown"
//                    book.publisher = "Unknown"
//                    book.delete = false
//                    book.wrappedStatus = .available
//
//                    CoreDataController.controller.save()

//                    CoreDataController.controller.deleteData(entityName: "Book", toPredicate: ["title"], predicateValue: ["nil"])
//                    let user = User(context: CoreDataController.controller.context)
//                    let userID = UUID().uuidString
//                    user.id = userID
//                    user.name = "James"
//                    user.password = "123456"
//                    user.role = "admin"
//                    user.delete = false
//
//                    let member = Member(context: CoreDataController.controller.context)
//                    let memberID = UUID().uuidString
//                    member.id = memberID
//                    member.name = "Albert"
//                    member.start_date = Date()
//                    member.delete = false
//
//                    let book = Book(context: CoreDataController.controller.context)
//                    let bookID = UUID().uuidString
//                    book.id = bookID
//                    book.title = "Now You See Me"
//                    book.author = "Isabella Ridge"
//                    book.wrappedStatus = .available
//                    book.published_date = Date()
//                    book.publisher = "Columbia"
//                    book.delete = false
//
//                    let transaction = Transaction(context: CoreDataController.controller.context)
//                    let transactionID = UUID().uuidString
//                    transaction.id = transactionID
//                    transaction.user_id = userID
//                    transaction.member_id = memberID
//                    transaction.transaction_date = Date()
//                    transaction.is_finished = false
//                    transaction.delete = false
//
//                    let detail = TransactionDetail(context: CoreDataController.controller.context)
//                    detail.transaction_id = transactionID
//                    detail.book_id = bookID
//                    detail.delete = false
        
//                    CoreDataController.controller.save()
//                }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
