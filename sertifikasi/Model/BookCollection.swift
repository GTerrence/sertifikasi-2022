//
//  Books.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import Foundation

struct BookCollection {
    
    var books : [Book] = []
    
    mutating func getNewestBooks() {
        guard let tempBooks = CoreDataController.controller.selectAllCoreData(entityName: "Book") as? [Book] else {
            print("Object is not a book")
            return
        }
        self.books = tempBooks
    }
    
}
