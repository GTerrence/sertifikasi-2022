//
//  CardTransactionView.swift
//  sertifikasi
//
//  Created by Terrence Pramono on 19/12/22.
//

import SwiftUI

struct CardTransactionView: View {
    
    var transactionID : String
    var transactionStatus : String
    var transactionDate : String
    
    var body: some View {
        //Card
        NavigationLink {
            TransactionDetailView(transactionID: transactionID)
        } label: {
            HStack{
                VStack{
                    Rectangle()
                        .frame(width: 20, height: 80)
                        .background(Color.black)
                }
                
                VStack {
                    Text(transactionStatus)
                        .font(.system(size: 15, weight: .bold))
                        .lineLimit(2)
                        .padding(.trailing, 10)
                        .frame(alignment: .leading)
                        .foregroundColor(Color.black)
                    Text(transactionDate)
                        .font(.system(size: 12, weight: .medium))
                        .lineLimit(2)
                        .padding(.trailing, 10)
                        .frame(alignment: .leading)
                        .foregroundColor(Color.black)
                }
                
                    

                Spacer()
//
//                Image(systemName: "chevron.right")
//                    .padding(.trailing, 15)
//                    .foregroundColor(Color.gray)

            }
            .background(.white)
            .cornerRadius(13)
            //.padding(30) //safe area
//            .shadow(color: Color.gray.opacity(0.275), radius: 8, x: 2, y: 4)
            //Close of Card
        }

    }
}

struct CardTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        CardTransactionView(transactionID: UUID().uuidString, transactionStatus: "", transactionDate: "")
    }
}
