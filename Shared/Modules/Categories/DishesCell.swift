//
//  DishesCell.swift
//  Egitim_Doyduk (iOS)
//
//  Created by Remzi Solmaz on 5.01.2022.
//

import SwiftUI

struct DishesCell: View {
    
    let content:DoydukResult
    
    var body: some View {
        
        ZStack{
            Color.backgroundColor.ignoresSafeArea()
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
                .frame( height: 90)
                .padding(.leading,30)
                .padding(.trailing,20)
                .shadow(color: Color.shadowDishes, radius: 80, x: 5, y: 4)
            
            HStack (alignment: .top) {
                AsyncImage(url: content.dishesImageURL) { image in
                    image
                        .resizable()
                        .cornerRadius(4)
                       // .scaledToFill()
                        .frame(width: 74, height: 69)
                        .clipped()
                } placeholder: {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.textWhite)
                        .frame(width: 74, height: 69)
                        .overlay(ProgressView())
                }
                
                VStack(alignment:.leading,spacing:3){
                    Text(content.name ?? "")
                        .modifier(TextModifier(font: .detailTitle, foregroundColor: .textPrimary))
                    
                    Text(content.description ?? "")
                        .modifier(TextModifier(font: .detailDescripton, foregroundColor: .textPrimary))
                        .lineLimit(3)
                    
                }
                Spacer()
                
                
                Text(content.priceAsStr)
                    .modifier(TextModifier(font: .typiedText, foregroundColor: .textPrimary))
                    .padding(.all,6)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(4)
            }.padding(.leading,10)
             .padding(.trailing,30)
        }
    }
}

struct DishesCell_Previews: PreviewProvider {
    static var previews: some View {
        DishesCell(content: DoydukResult.fakeDishesData())
    }
}
