//
//  CheifSpecialView.swift
//  Egitim_Doyduk (iOS)
//
//  Created by Barış Şaraldı on 7.01.2022.
//

import SwiftUI

struct CheifSpecialView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: CategoryViewModel
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.splash
                .frame(height: 100)
            HStack {
                VStack {
                    Text("Şef'in önerisi")
                        .font(Font.text)
                        .foregroundColor(Color.textWhite)
                    
                    Text(viewModel.chiefSpecial?.name ?? "")
                        .font(Font.boldText)
                        .foregroundColor(Color.textWhite)
                }
                .padding(.leading,52)
                
                ZStack {
                    viewModel.chiefSpecial?.categoryColorWithId
                        .frame(width: 121, height: 121)
                        .clipShape(Circle())
                        .padding(.bottom,5)
                        .padding(.leading,7)
                    
                    AsyncImage(url: URL(string: viewModel.chiefSpecial?.dishesImg ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 121, height: 121)
                            .clipShape(Circle())
                        
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.red)
                            .frame(width: 121, height: 121)
                            .clipShape(Circle())
                            .overlay(ProgressView())
                    }
                }
                .padding(.trailing,25)
            }
        }
    }
}

//struct CheifSpecialView_Previews: PreviewProvider {
//    static var previews: some View {
//        let view
//        CheifSpecialView()
//    }
//}
