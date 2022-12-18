//
//  BookDetailView.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import SwiftUI

struct BookDetailView: View {
    
    @StateObject var viewModel = BookDetailViewModel()
    
    var body: some View {
        Form {
            Section (header: Text("Title")
                .foregroundColor(Color.blue)
                .bold()
            ){
                TextField("Ex: Morning Run", text: $viewModel.bookTitle)
                    .padding(.all, 7.0)
                    .foregroundColor(Color.black)
                //                            .padding(.horizontal)
            }
            
            Section (header: Text("Author")
                .foregroundColor(Color.blue)
                .bold()
            ){
                TextField("Ex: Morning Run", text: $viewModel.bookTitle)
                    .padding(.all, 7.0)
                    .foregroundColor(Color.black)
                //                            .padding(.horizontal)
            }
            Section (header: Text("Publisher")
                .foregroundColor(Color.blue)
                .bold()
            ){
                TextField("Ex: Morning Run", text: $viewModel.bookTitle)
                    .padding(.all, 7.0)
                    .foregroundColor(Color.black)
                //                            .padding(.horizontal)
            }
            Section (header: Text("Status")
                .foregroundColor(Color.blue)
                .bold()
            ){
                Picker(
                    selection: $viewModel.bookStatus,
                    label:
                        HStack{
                            Text(viewModel.bookStatus.displayedValue)
//                                .font(.headline)
//                                .foregroundColor(.white)
                        },
                    content: {
                        ForEach(BookStatus.allCases, id: \.self){
                            option in
                            HStack{
                                Text(option.displayedValue)
                            }
                            .tag(option)
                        }//forEachContent
                    }//pickerContent
                )//Picker
            }
        }
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView()
    }
}
