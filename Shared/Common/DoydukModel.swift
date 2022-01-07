//
//  DoydukModel.swift
//  Doyduk
//
//  Created by Oğuz Demirhan on 24.12.2021.
//

import Foundation
import SwiftUI

struct DoydukModel: Codable {
    let status: String?
    let statusCode: Int?
    let result: [DoydukResult]?
    let message: String?
}

// MARK: - Result
struct DoydukResult: Codable,Hashable {
    let id: Int?
    let name, resultPrefix,description : String?
    let categoryImg: String?
    let dishesImg: String?
    let price, categoryID: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultPrefix = "prefix"
        case categoryImg = "img_url"
        case dishesImg = "image_url"
        case price
        case categoryID = "category_id"
        case description
    }
    
    
    var categoryColorWithId: Color {
        switch id {
        case 1:
            return Color.soup
        case 2:
            return Color.salad
        case 3:
            return Color.pizza
        case 4:
            return Color.pasta
        case 5:
            return Color.steak
        case 6:
            return Color.fish
        case 7:
            return Color.desert
        default:
            return Color.white
        }
    }
    
    
    var categoryColorWithCategoryId: Color {
        switch categoryID {
        case 1:
            return Color.soup
        case 2:
            return Color.salad
        case 3:
            return Color.pizza
        case 4:
            return Color.pasta
        case 5:
            return Color.steak
        case 6:
            return Color.fish
        case 7:
            return Color.desert
        default:
            return Color.white
        }
    }
}
 
extension DoydukResult {
    
    var categoryImageURL:URL? {
        URL(string: categoryImg ?? "")
    }
    
    var dishesImageURL:URL? {
        URL(string: dishesImg ?? "")
    }
    
    var priceAsStr:String {
        "\(price ?? 0) TL"
    }
}
/*
{
  "status": "OK",
  "statusCode": 200,
 "message": "Success",
  "result": [
    {
      "id": 1,
      "name": "Ã‡orbalar",
      "prefix": "Ä°Ã§inizi Ä±sÄ±tan",
      "img_url": "https://firebasestorage.googleapis.com/v0/b/akademi101-58d94.appspot.com/o/corba10.jpg?alt=media&token=1eb208d3-5639-480e-8928-92d46fa8ec0f",
      "backgroundColor": null
    },
    {
      "id": 2,
      "name": "Salatalar!",
      "prefix": "Fit ve eÄŸlenceli",
      "img_url": "https://firebasestorage.googleapis.com/v0/b/akademi101-58d94.appspot.com/o/salata1.jpeg?alt=media&token=a2984f69-8da7-408f-bdfc-90aee1067ce8",
      "backgroundColor": null
    }
   ]
 
 }
*/

extension DoydukResult {
    
    static func fakeData() -> DoydukResult {
        DoydukResult(id: 1, name: "Çorba", resultPrefix: "İçinizi ısıtan", description: "Çorbalar",
                                          categoryImg: "https://firebasestorage.googleapis.com/v0/b/akademi101-58d94.appspot.com/o/corba10.jpg?alt=media&token=1eb208d3-5639-480e-8928-92d46fa8ec0f",
                                          dishesImg: nil, price: 23, categoryID: 1)
    }
    
    static func fakeDishesData() -> DoydukResult {
        DoydukResult(id: 1, name: "Çorba", resultPrefix: "İçinizi ısıtan", description: "Lahana çorbası",
                                          categoryImg: nil,
                                          dishesImg: "https://firebasestorage.googleapis.com/v0/b/akademi101-58d94.appspot.com/o/corba10.jpg?alt=media&token=1eb208d3-5639-480e-8928-92d46fa8ec0f", price: 23, categoryID: 1)
    }
}
