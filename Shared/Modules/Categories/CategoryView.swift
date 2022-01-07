//
//  CategoryView.swift
//  Egitim_Doyduk
//
//  Created by Remzi Solmaz on 3.01.2022.
//

import SwiftUI

struct CategoryView: View {
    
    let username:String
    let tableNo:String
    
    @StateObject var viewModel :CategoryViewModel = CategoryViewModel()
    
    var body: some View {
        
        ZStack
        {
            Color.backgroundColor.ignoresSafeArea(.all)
            
            if ViewState.loading == viewModel.state {
                ProgressView()
            }
            
            if ViewState.error == viewModel.state {
                Text(viewModel.errorMessage ?? "")
            }
            
            if ViewState.ready == viewModel.state {
                
                VStack(spacing: 10) {
                    //1. Navigation bar
                    EgitimNavavbar(username: username, tableNo: tableNo,image: .logout)
                        .padding(.top,20)
                    //.frame(height: 55)
                    
                    //2 TitleView
                    HStack {
                        Color.black
                            .frame(width: 19, height: 3)
                        Text("Kategoriler")
                            .modifier(TextModifier(font: .typiedText, foregroundColor: .textPrimary))
                        Spacer()
                    }
                    Spacer()
                    //3 Liste olacak
                    
                    ScrollView{
                        
                        ForEach(viewModel.categories,id:\.self) { item in
                            NavigationLink(destination: CategoryDetailView(username: username,
                                                                           tableNo: tableNo,
                                                                           viewModel: CategoryDetailViewModel(item))) {
                                CategoryCell(content: item)
                            }
                        }
                    }
                    
                    
                    
                    //4 şefin önerisi
                    CheifSpecialView(viewModel: viewModel)
                        .offset(y: 15)
                        
                        
                    
                }
                .ignoresSafeArea(.all, edges: .bottom)
                
            }
        }.onAppear {
            viewModel.fetchCategories()
            viewModel.fetchCheifSpecial()
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(username: "remzi",tableNo: "7")
    }
}
