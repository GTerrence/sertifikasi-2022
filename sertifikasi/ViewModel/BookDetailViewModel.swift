//
//  BookDetailViewModel.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import Foundation
import SwiftUI

class BookDetailViewModel : ObservableObject {
    
    @Published var bookTitle : String = ""
    @Published var author : String = ""
    @Published var publisher : String = ""
    
    @Published var bookStatus : BookStatus = .available
    @Published var imageSelected = UIImage(systemName: "plus")!
    
    @Published var isEditMode = false
    
    private var bookID : String?
    
    func setup(bookID : String) {
        guard let book = CoreDataController.controller.selectOneWhereCoreData(entityName: "Book", toPredicate: "id", predicateValue: bookID).first as? Book else {
            print("No book id")
            return
        }
        
        self.bookID = bookID
        bookTitle = book.wrappedTitle
        author = book.wrappedAuthor
        publisher = book.wrappedPublisher
        
        bookStatus = book.wrappedStatus
        if let imageData = book.cover_image {
            imageSelected = UIImage(data: imageData) ?? UIImage(systemName: "plus")!
        }
    }
    
    func rentBook() {
        if bookStatus == .available {
            let transaction = Transaction(context: CoreDataController.controller.context)
            transaction.id = UUID().uuidString
            transaction.book_id = self.bookID!
            transaction.transaction_date = Date()
            transaction.user_id = UUID().uuidString
            transaction.delete = false
            
            guard let book = CoreDataController.controller.selectOneWhereCoreData(entityName: "Book", toPredicate: "id", predicateValue: self.bookID!).first as? Book else {
                print("No book id")
                return
            }
            book.wrappedStatus = .borrowed
            
            CoreDataController.controller.save()
        }
    }
    
    func editBook() {
        guard let book = CoreDataController.controller.selectOneWhereCoreData(entityName: "Book", toPredicate: "id", predicateValue: self.bookID!).first as? Book else {
            print("No book id")
            return
        }
        book.title = bookTitle
        book.author = author
        book.publisher = publisher
        book.wrappedStatus = bookStatus
        if imageSelected != UIImage(systemName: "plus") {
            book.cover_image = imageSelected.pngData()
        }
        
        CoreDataController.controller.save()
    }
    
    func addNewBook() -> Bool {
        
        if bookTitle == "" || author == "" || publisher == "" || imageSelected == UIImage(systemName: "plus") {
            print("Failed to input data")
            return false
        }
        let book = Book(context: CoreDataController.controller.context)
        
        
        
        book.id = UUID().uuidString
        book.title = bookTitle
        book.author = author
        book.publisher = publisher
        book.wrappedStatus = bookStatus
        book.cover_image = imageSelected.pngData()
        book.delete = false
        
        CoreDataController.controller.save()
        
        return true
    }
}
