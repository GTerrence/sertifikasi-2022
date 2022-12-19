//
//  GlobalObject.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 19/12/22.
//

import Foundation

class GlobalObject {
    static let shared = GlobalObject()
    
    var userID = ""
    var user : User?
    
    func getUser() {
        guard let tempUser = CoreDataController.controller.selectOneWhereCoreData(entityName: "User", toPredicate: "id", predicateValue: self.userID).first as? User else { return }
        self.user = tempUser
    }
}
