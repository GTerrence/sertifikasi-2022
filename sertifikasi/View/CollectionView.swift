//
//  CollectionView.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import SwiftUI

struct CollectionView: View {
    
    @StateObject var viewModel : CollectionViewModel = CollectionViewModel()
    
    var body: some View {
//        NavigationView{
            ScrollView {
                VStack{
                    ForEach((0..<viewModel.books.books.count / 2 + 1), id: \.self) { i in
                        HStack{
                            BookCard(title: viewModel.books.books[i * 2].wrappedTitle)
                            
                            if viewModel.books.books.count > i * 2 + 1 {
                                BookCard(title: viewModel.books.books[i * 2 + 1].wrappedTitle)
                            } else {
                                Spacer()
                            }
                        }
                    }
                }
            }
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
