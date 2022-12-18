//
//  BookCard.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 18/12/22.
//

import SwiftUI

struct BookCard: View {
    
    var title : String
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 50)
            HStack{
                Text(title)
                Spacer()
                Image(systemName: "chevron.right")
                    .padding(.trailing, 15)
                    .foregroundColor(Color.gray)
            }
        }
        .background(.white)
        .cornerRadius(13)
        .frame(width: UIScreen.main.bounds.width - 50)
        .shadow(color: Color.gray.opacity(0.275), radius: 8, x: 2, y: 4)
    }
}

struct BookCard_Previews: PreviewProvider {
    static var previews: some View {
        BookCard(title: "Judul")
    }
}
