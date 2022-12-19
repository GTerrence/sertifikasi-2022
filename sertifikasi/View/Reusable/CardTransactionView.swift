//
//  CardTransactionView.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 19/12/22.
//

import SwiftUI

struct CardTransactionView: View {
    var body: some View {
        //Card
        HStack{
            VStack{
                Rectangle()
                    .padding(.trailing, 10)
                    .padding(.leading, 10)
                    .frame(width: 20, height: 80)
                    .background(Color.black)
            }
            
            
            Text("Test")
                .font(.system(size: 15, weight: .bold))
                .lineLimit(2)
                .padding(.trailing, 10)
                .frame(alignment: .leading)
                .foregroundColor(Color.black)
                

            Spacer()
            
            Image(systemName: "chevron.right")
                .padding(.trailing, 15)
                .foregroundColor(Color.gray)

        }
        .background(.white)
        .cornerRadius(13)
        .padding(.bottom, 20)
        .padding(.trailing, 30)
        .padding(.leading, 30)
        //.padding(30) //safe area
        .shadow(color: Color.gray.opacity(0.275), radius: 8, x: 2, y: 4)
        //Close of Card
    }
}

struct CardTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        CardTransactionView()
    }
}
