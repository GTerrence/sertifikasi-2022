//
//  BookCard.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import SwiftUI

struct BookCard: View {
    
    var bookID : String
    var title : String
    var image : UIImage
    
    var body: some View {
        NavigationLink(destination: BookDetailView(bookID:bookID)) {
            ZStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 200)
                VStack{
                    Image(uiImage: image)
                        .resizable()
                        .foregroundColor(Color.gray)
                        .frame(width: UIScreen.main.bounds.width / 2 - 20, height: 150)
                    Text(title)
                }
            }
        }
        .background(.white)
        .cornerRadius(13)
        .frame(width: UIScreen.main.bounds.width / 2 - 20)
        .padding(.horizontal, 10)
        .shadow(color: Color.gray.opacity(0.275), radius: 8, x: 2, y: 4)
    }
}

struct BookCard_Previews: PreviewProvider {
    static var previews: some View {
        BookCard(bookID: UUID().uuidString, title: "Judul", image: UIImage())
    }
}
