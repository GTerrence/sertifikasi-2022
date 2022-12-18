//
//  BookDetailViewModel.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import Foundation

class BookDetailViewModel : ObservableObject {
    
    @Published var bookTitle : String = ""
    @Published var author : String = ""
    @Published var publisher : String = ""
    
    @Published var bookStatus : BookStatus = .available
}
