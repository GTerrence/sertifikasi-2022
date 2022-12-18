//
//  ContentView.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Background {
            LoginView()
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
