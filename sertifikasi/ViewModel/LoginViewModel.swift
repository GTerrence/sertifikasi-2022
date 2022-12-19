//
//  LoginViewModel.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import Foundation
import SwiftUI

class LoginViewModel : ObservableObject {
    @Published var userName : String = ""
    @Published var password : String = ""
    
    
    func login() -> Bool {
        guard let user = CoreDataController.controller.selectMultipleWhereAndCoreData(entityName: "User", toPredicate: ["name", "password"], predicateValue: [userName, password]).first as? User else {
            print("failed")
            return false
        }
        print("Success")
        GlobalObject.shared.userID = user.id!
        GlobalObject.shared.getUser()
        return true
    }
}
