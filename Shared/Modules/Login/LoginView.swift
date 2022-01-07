//
//  LoginView.swift
//  Egitim_Doyduk
//
//  Created by Remzi Solmaz on 3.01.2022.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var tableNo: String = ""
    
    @State private var navigateCategory: Bool = false
    
    var isClickable:Bool {
        username != "" && tableNo != ""
    }
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack{
                Image("LogoImage")
                    .padding(.top,50)
                
                Spacer(minLength: 80)
                
                VStack( spacing: 10)
                {
                    LoginTextView(text: $username, placeholder: "Ad Soyad",keyboardType: .asciiCapable)
                    LoginTextView(text: $tableNo, placeholder: "Masa No",keyboardType: .numberPad)
                    Spacer()
                }.padding()
                Spacer()
                
                Button {
                    navigateCategory.toggle()
                } label: {
                    buttonContent()
                }
                
                NavigationLink("", isActive: $navigateCategory) {
                    CategoryView(username: username, tableNo: tableNo)
                        .navigationBarHidden(true)
                }
            }
        }
    }
}

extension LoginView {
    
    private func buttonContent() -> some View {
        HStack
        {
            Spacer()
            Text("GİRİŞ")
                .foregroundColor(Color.white)
                .font(Font.button)
            Spacer()
        }.frame(height: 50)
            .background(Color.splash)
            .cornerRadius(8)
            .disabled(isClickable == false)
            .opacity(isClickable ? 1: 0.5)
            .padding(.horizontal,25)
            .padding(.bottom)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
