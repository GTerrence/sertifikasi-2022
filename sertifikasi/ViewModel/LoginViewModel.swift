//
//  LoginViewModel.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import Foundation

class LoginViewModel : ObservableObject {
    @Published var userName : String = ""
    @Published var password : String = ""
    
    func login() {
        let user = CoreDataController.controller.selectMultipleWhereAndCoreData(entityName: "User", toPredicate: ["name", "password"], predicateValue: [userName, password])
        if user.count >= 1 {
            print("berhasil login")
        } else {
            print("failed")
        }
    }
}