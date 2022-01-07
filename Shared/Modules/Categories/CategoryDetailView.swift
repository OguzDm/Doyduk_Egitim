//
//  CategoryDetailView.swift
//  Egitim_Doyduk (iOS)
//
//  Created by Remzi Solmaz on 5.01.2022.
//

import SwiftUI

struct CategoryDetailView: View {
    
    let username:String
    let tableNo:String
    @ObservedObject var viewModel :CategoryDetailViewModel
    
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
                    EgitimNavavbar(username: username, tableNo: tableNo,image: .back)
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
                        
                        ForEach(viewModel.dishes,id:\.self) { item in
                            NavigationLink(destination: DishesDetailView(userName: username, tableNo: tableNo, content: item,category: viewModel.category)) {
                               
                                DishesCell(content: item)
                            }
                        }
                    }
                    
                    
                    
                    //4 şefin önerisi
                    
                }
                
            }
           
        }.onAppear {
            viewModel.fetchDishes()
        }
        .navigationBarHidden(true)
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView(username: "remzi", tableNo: "7", viewModel: CategoryDetailViewModel(DoydukResult.fakeData()))
       
    }
}

