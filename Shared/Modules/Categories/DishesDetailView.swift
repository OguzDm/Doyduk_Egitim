//
//  DishesDetailView.swift
//  Egitim_Doyduk (iOS)
//
//  Created by Remzi Solmaz on 7.01.2022.
//

import SwiftUI

struct DishesDetailView: View {
    
    let userName: String
    let tableNo: String
    let content: DoydukResult
    let category: DoydukResult
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.backgroundColor.ignoresSafeArea()
                
                
                VStack {
                    EgitimNavavbar(username: userName, tableNo: tableNo, image: .back)
                    
                    TitleView(text: category.name ?? "-", color: content.categoryColorWithCategoryId)
                        .padding(.top,10)
                    
                    AsyncImage(url: content.dishesImageURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: proxy.size.width - 60, height: proxy.size.width / 1.29)
                            .cornerRadius(4)
                            .clipped()
                            .padding(.top,10)

                        
                    }
                placeholder: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.white)
                                .frame(width: proxy.size.width - 60, height: proxy.size.width / 1.29)
                            ProgressView()
                        }
                        
                        
                    }
                    
                    ZStack(alignment: .topLeading) {
                        
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                            .padding(.horizontal,30)
                            .frame(width: proxy.size.width, height: proxy.size.width / 3.23)
                        
                        HStack {
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(content.name ?? "-")
                                        .modifier(TextModifier(font: .detailTitle, foregroundColor: .textPrimary))
                                        .padding(.leading,32)
                                    Spacer()
                                }
                                .frame(width: proxy.size.width / 1.66 ,height: proxy.size.width / 19)
                                .background(content.categoryColorWithCategoryId)
                                .cornerRadius(8)
                                .padding(.top,14)
                                .padding(.leading,20)
                                
                                Text(content.description ?? "-")
                                    .modifier(TextModifier(font: .detailDescripton, foregroundColor: .textPrimary))
                                    .padding(.leading,52)
                                
                                Spacer()

                            }
                            
                            Spacer()
                            
                            VStack {
                                ZStack {
//                                    RoundedRectangle(cornerRadius: 4)
//                                        .fill(.gray)
                                    
                                    Text(content.priceAsStr)
                                        .modifier(TextModifier(font: .typiedText, foregroundColor: .textPrimary))
                                        .padding(.all,2)
                                        .background(.gray.opacity(0.6))
                                        .cornerRadius(4)
                                }
                                .fixedSize()
                                .padding(.top,14)
                                
                                Spacer()
                            }
                            .padding(.trailing,45)
                        }
                        
                    }
                    .frame(width: proxy.size.width, height: proxy.size.width / 3.23)
                    .padding(.top,7)

                    Spacer()
                }
                .navigationBarHidden(true)
            }
        }
    }
}

struct DishesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DishesDetailView(userName: "Oğuz", tableNo: "7", content: DoydukResult.fakeData(),category: DoydukResult.fakeData())
    }
}
