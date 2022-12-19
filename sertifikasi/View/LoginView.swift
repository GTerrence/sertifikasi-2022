//
//  LoginView.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    @State var isHomeViewActive : Bool = false
    
    
    var body: some View {
//        Background {
            NavigationView{
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
                    NavigationLink(destination: HomeView(), isActive: $isHomeViewActive) {
                        Button("Login") {
                            if viewModel.login() {
                                isHomeViewActive = true
                            }
                        }
                    }
                    Spacer()
                        .frame(height : 20)
                    NavigationLink(destination: HomeView()) {
                        Text("Enter Without Login")
                    }
                }
            }
//        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
