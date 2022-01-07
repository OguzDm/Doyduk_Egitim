//
//  EgitimNavavbar.swift
//  Egitim_Doyduk (iOS)
//
//  Created by Remzi Solmaz on 5.01.2022.
//

import SwiftUI

enum backButtonImage: String {
    case logout = "Logout"
    case back = "BackButton"
}

struct EgitimNavavbar: View {
    
    @Environment(\.presentationMode) var presentingMode

    let username:String
    let tableNo:String
    var image : backButtonImage
    
    var body: some View {
        //ZStack {
          //  Color.backgroundColor.ignoresSafeArea()
                HStack {
                    Button {
                        presentingMode.wrappedValue.dismiss()
                    } label: {
                        Image(image.rawValue)
                    }
                    
                    Spacer()
                    HStack {
                        Text("Hoşgeldin")
                            .modifier(TextModifier(font: .typiedText, foregroundColor: .textPrimary))
                        
                        Text(username)
                            .modifier(TextModifier(font: .boldText, foregroundColor: .textPrimary))
                       
                    }
                    
                    ZStack {
                        Circle()
                            .fill(Color.desk)
                            .frame(width: 36, height: 36)
                        Text(tableNo)
                    }
                }.padding(.horizontal)
                 
                .frame( height: 55)
                .background(Color.white)
                
        //}
    }
}

struct EgitimNavavbar_Previews: PreviewProvider {
    static var previews: some View {
        EgitimNavavbar(username: "remzi",tableNo: "7",image: .back)
    }
}


struct TextModifier:ViewModifier {
    
    let font:Font
    let foregroundColor:Color
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(foregroundColor)
    }
}
