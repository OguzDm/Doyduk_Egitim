//
//  LoginTextView.swift
//  Egitim_Doyduk
//
//  Created by Remzi Solmaz on 3.01.2022.
//

import SwiftUI

struct LoginTextView: View {
    
    @Binding var text:String
    let placeholder:String
    let keyboardType:UIKeyboardType
    var body: some View {
        VStack{
            TextField(placeholder, text: $text)
                .onChange(of: text, perform: { newValue in
                    print(newValue)
                })
                
                .foregroundColor(Color.textPrimary)
                .font(Font.text)
                .keyboardType(keyboardType)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8).stroke(Color.gray,lineWidth: 1))
        }
    }
}

struct LoginTextView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextView(text: .constant("Remzi solmaz"), placeholder: "name", keyboardType: .default)
    }
}
