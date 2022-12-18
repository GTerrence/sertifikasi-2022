//
//  BookStatus.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import Foundation

enum BookStatus : Int16, CaseIterable{
    case available = 1
    case borrowed = 0
    
    var displayedValue : String {
        switch self {
        case .available:
            return "Available"
        case .borrowed:
            return "Borrowed"
        }
    }
}
