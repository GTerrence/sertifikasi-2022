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
    
    @State var isAddNewBook = false
    
    //var for submission image picker
    @State var changeSubmissionImage = false
    @State var openCameraSheet = false
    var bookID : String?
    
    var body: some View {
        VStack {
            if isAddNewBook {
                HStack{
                    Button("cancel") {
                        self.mode.wrappedValue.dismiss()
                    }
                    .padding(.leading, 5)
                    Spacer()
                }
            }
            
            if isAddNewBook || viewModel.isEditMode {
                Button(action: {
                    //Action
                    changeSubmissionImage = true
                    openCameraSheet = true
                }, label: {
                    ZStack {
                        
                        Image(uiImage: viewModel.imageSelected)
                            .resizable()
                            .frame(width: 125, height: 200, alignment: .center)
                            .foregroundColor(.red)
                            .padding()
                        
                        Rectangle()
                            .foregroundColor(Color.black.opacity(0.6))
                            .frame(width: 125, height: 200, alignment: .center)
                            
                        
                        Text("Change Image")
                            .font(.caption)
                        
                        
                    }
                })//Button
                .sheet(isPresented: $openCameraSheet) {
                    SubmissionPicker(selectedImage: $viewModel.imageSelected, sourceType: .photoLibrary)
                }
            } else {
                ZStack {
                    Image(uiImage: viewModel.imageSelected)
                        .resizable()
                        .frame(width: 125, height: 200, alignment: .center)
                        .foregroundColor(.red)
                        .padding()
                }
            }
            
            Form {
                Section (header: Text("Title")
                    .foregroundColor(Color.blue)
                    .bold()
                ){
                    TextField("Enter Title", text: $viewModel.bookTitle)
                        .disabled(!viewModel.isEditMode && !isAddNewBook)
                        .padding(.all, 7.0)
                        .foregroundColor(Color.black)
                    //                            .padding(.horizontal)
                }
                
                Section (header: Text("Author")
                    .foregroundColor(Color.blue)
                    .bold()
                ){
                    TextField("Enter Author", text: $viewModel.author)
                        .disabled(!viewModel.isEditMode && !isAddNewBook)
                        .padding(.all, 7.0)
                        .foregroundColor(Color.black)
                    //                            .padding(.horizontal)
                }
                Section (header: Text("Publisher")
                    .foregroundColor(Color.blue)
                    .bold()
                ){
                    TextField("Enter Publisher", text: $viewModel.publisher)
                        .disabled(!viewModel.isEditMode && !isAddNewBook)
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
                    .disabled(!viewModel.isEditMode && !isAddNewBook)
                }
            }
            
            Spacer()
            
            if GlobalObject.shared.user != nil {
                if GlobalObject.shared.user!.wrappedRole == .admin {
                    Button(viewModel.isEditMode ? "Edit Book Data" : isAddNewBook ? "Add New Book" : "Delete Book") {
                        if viewModel.isEditMode == true {
                            viewModel.editBook()
                            viewModel.isEditMode = false
                            return
                        } else if isAddNewBook == true {
                            if viewModel.addNewBook() {
                                self.mode.wrappedValue.dismiss()
                            }
                            return
                        }
                        viewModel.deleteBook()
                        self.mode.wrappedValue.dismiss()
                    }
                } else {
                    Button("Rent Book") {
                        viewModel.rentBook()
                    }
                    .disabled(viewModel.bookStatus == .borrowed)
                }
            }
            
            
        }
        .navigationBarHidden(isAddNewBook)
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading:
            Button(action: {
                self.mode.wrappedValue.dismiss()
            }, label: {
                Text("Back")
            }),
            
            trailing:
                Button(action: {
                    viewModel.isEditMode.toggle()
                }, label: {
                    if GlobalObject.shared.user != nil {
                        if GlobalObject.shared.user!.wrappedRole == .admin {
                            Text("Edit")
                        }
                    } else {
                        Text("")
                    }
                })
            
            
        )
        .onAppear() {
            if bookID != nil {
                viewModel.setup(bookID: bookID!)
                return
            }
            self.isAddNewBook = true
        }
        
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView()
    }
}
