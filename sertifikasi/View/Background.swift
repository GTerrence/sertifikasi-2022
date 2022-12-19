//
//  Background.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import Foundation
import SwiftUI

struct Background<Content: View>: View {
    private var content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        Color.white
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .overlay(content)
//        .onTapGesture {
//            UIApplication.shared.endEditing()
//        }
    }
}
