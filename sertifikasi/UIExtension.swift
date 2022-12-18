//
//  UIExtension.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
