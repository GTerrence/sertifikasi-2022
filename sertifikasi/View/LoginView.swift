//
//  LoginView.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
            VStack {
                HStack {
                    Text("Name")
                    TextField("Enter Your Name", text: $viewModel.userName)
                }
                HStack {
                    Text("Password")
                    TextField("Enter Password", text: $viewModel.password)
                }
                Spacer()
                    .frame(height : 20)
                Button("Login") {
                    viewModel.login()
                }
                Spacer()
                    .frame(height : 20)
                Button("Enter without login") {
                    
                }
            }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
