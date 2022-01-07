//
//  TitleView.swift
//  Doyduk
//
//  Created by Barış Şaraldı on 27.12.2021.
//

import SwiftUI

struct TitleView: View {
    var text: String
    var color: Color
    var body: some View {
        HStack {
            color
                .frame(width: 19, height: 3)
                .cornerRadius(8)
            
            Text(text)
                .modifier(TextModifier(font: .text, foregroundColor: .textPrimary))
            
            Spacer()
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(text: "Kategoriler", color: Color.soup)
    }
}
