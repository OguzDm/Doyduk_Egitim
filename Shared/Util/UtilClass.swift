//
//  UtilClass.swift
//  Egitim_Doyduk
//
//  Created by Remzi Solmaz on 3.01.2022.
//


import SwiftUI

extension Font {
    
    static func appFont(size: CGFloat, type:String) -> Font
    {
        return Font.custom(type, size: size)
    }
    
    static let text = appFont(size: 14, type: "Roboto-Regular")
    static let typiedText = appFont(size: 16, type: "Roboto-Regular")
    static let button = appFont(size: 14, type: "Roboto-Regular")
    static let boldText = appFont(size: 21, type: "Roboto-Black")
    static let detailTitle = appFont(size: 13, type: "Roboto-Regular")
    static let detailDescripton = appFont(size: 10, type: "Roboto-Regular")
}


extension Color
{
    static let backgroundColor = Color("Background")
    static let desk = Color("Desk")
    static let logout = Color("Logout")
    static let splash = Color("Splash")
    static let title = Color("Title")
    static let textLight = Color("textLight")
    static let textPrimary = Color("textPrimary")
    static let textWhite = Color("textWhite")
    static let edge = Color("Edge")
    static let textfieldEdge = Color("textfieldEdge")
    static let soup = Color("orange")
    static let salad = Color("Green")
    static let pizza = Color("Brown")
    static let pasta = Color ("Yellow")
    static let steak = Color ("Bordeaux")
    static let fish = Color ("LightYellow")
    static let desert = Color("Fondoten")
    static let shadow = Color(red: 177/255, green:  177/255, blue:  177/255,opacity: 0.25)
    static let shadowDishes =  Color(red: 229/255, green:  225/255, blue:  225/255,opacity: 0.25)
    
}
