//
//  CollectionView.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import SwiftUI

struct CollectionView: View {
    
    @StateObject var viewModel : CollectionViewModel = CollectionViewModel()
    
    @State var isAddBookViewPresented = false
    @State var isThereChangeInBooks = true
    
    var body: some View {
//        NavigationView{
        ZStack {
            ScrollView {
                VStack{
                    ForEach((0..<viewModel.books.books.count / 2 + viewModel.books.books.count % 2), id: \.self) { i in
                        HStack{
                            BookCard(bookID: viewModel.books.books[i * 2].id ?? "No id", title: viewModel.books.books[i * 2].wrappedTitle, image: viewModel.books.books[i * 2].cover_image == nil ? UIImage(systemName: "plus")! : UIImage(data: viewModel.books.books[i * 2].cover_image!) != nil ? UIImage(data: viewModel.books.books[i * 2].cover_image!)! : UIImage(systemName: "plus")!)
                            
                            if viewModel.books.books.count > i * 2 + 1 {
                                BookCard(bookID: viewModel.books.books[i * 2 + 1].id ?? "No id", title: viewModel.books.books[i * 2 + 1].wrappedTitle, image: viewModel.books.books[i * 2 + 1].cover_image == nil ? UIImage(systemName: "plus")! : UIImage(data: viewModel.books.books[i * 2 + 1].cover_image!) != nil ? UIImage(data: viewModel.books.books[i * 2 + 1].cover_image!)! : UIImage(systemName: "plus")!)
                            } else {
                                Spacer()
                            }
                        }
                    }
                }
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button("+") {
                        isAddBookViewPresented.toggle()
                    }
                    .fullScreenCover(isPresented: $isAddBookViewPresented) {
                        viewModel.books.getNewestBooks()
                    } content: {
                        BookDetailView()
                    }

//                    .sheet(isPresented: $isAddBookViewPresented) {
//                        BookDetailView()
//                    }
                }
                
            }
        }
//        .onReceive(viewModel.$books) { _ in
//            if isThereChangeInBooks {
//                viewModel.books.getNewestBooks()
//                isThereChangeInBooks = false
//            } else {
//                isThereChangeInBooks = true
//            }
//        }
        .onAppear() {
            viewModel.books.getNewestBooks()
        }
        
    }
}

//struct CollectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionView()
//    }
//}
