//
//  BookDetailView.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import SwiftUI

struct BookDetailView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var viewModel = BookDetailViewModel()
    
    
    var bookID : String?
    
    var body: some View {
        VStack {
            Form {
                Section (header: Text("Title")
                    .foregroundColor(Color.blue)
                    .bold()
                ){
                    TextField("Enter Title", text: $viewModel.bookTitle)
                        .disabled(!viewModel.isEditMode)
                        .padding(.all, 7.0)
                        .foregroundColor(Color.black)
                    //                            .padding(.horizontal)
                }
                
                Section (header: Text("Author")
                    .foregroundColor(Color.blue)
                    .bold()
                ){
                    TextField("Enter Author", text: $viewModel.author)
                        .disabled(!viewModel.isEditMode)
                        .padding(.all, 7.0)
                        .foregroundColor(Color.black)
                    //                            .padding(.horizontal)
                }
                Section (header: Text("Publisher")
                    .foregroundColor(Color.blue)
                    .bold()
                ){
                    TextField("Enter Publisher", text: $viewModel.publisher)
                        .disabled(!viewModel.isEditMode)
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
                    .disabled(!viewModel.isEditMode)
                }
            }
            
            Spacer()
            
            Button("Rent Book") {
                if viewModel.isEditMode == true {
                    viewModel.editBook()
                    viewModel.isEditMode = false
                    return
                }
                viewModel.rentBook()
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading:
            Button(action: {
                self.mode.wrappedValue.dismiss()
            }, label: {
                Text("Back")
            }), trailing:
            Button(action: {
                viewModel.isEditMode.toggle()
            }, label: {
                Text("Edit")
            })
        )
        .onAppear() {
            if bookID != nil {
                viewModel.setup(bookID: bookID!)
            }
        }
        
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView()
    }
}
