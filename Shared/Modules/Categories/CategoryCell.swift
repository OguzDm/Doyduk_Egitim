//
//  CategoryCell.swift
//  Egitim_Doyduk (iOS)
//
//  Created by Remzi Solmaz on 5.01.2022.
//

import SwiftUI

struct CategoryCell: View {
    
    let content:DoydukResult
    
    var body: some View {
       
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            Color.white
                .frame( height: 40)
                .padding(.leading)
                .shadow(color: Color.shadow, radius: 7, x: -1, y: 2)
            
            
            HStack {
                ZStack{
                    content.categoryColorWithId
                        .frame(width: 104,height: 40)
                        .cornerRadius(8)
                    
                    AsyncImage(url: content.categoryImageURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 85, height: 73)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                    }
                }
                Spacer()
                HStack {
                    Text(content.resultPrefix ?? "")
                        .modifier(TextModifier(font: .typiedText, foregroundColor: .textPrimary))
                    
                    Text(content.name ?? "")
                        .modifier(TextModifier(font: .boldText, foregroundColor: .textPrimary))
                    
                    
                    Spacer()
                    Image("arrow-back")
                }
                
                
                
            }.padding(.leading)
             .offset(x: -5)
        }
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(content:DoydukResult.fakeData())
    }
}
