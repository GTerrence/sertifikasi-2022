//
//  CollectionViewModel.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import Foundation

class CollectionViewModel : ObservableObject {
    @Published var books : BookCollection = BookCollection()
    
    init() {
        books.getNewestBooks()
    }
}
