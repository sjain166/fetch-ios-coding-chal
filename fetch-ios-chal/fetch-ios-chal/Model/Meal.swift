//
//  Meal.swift
//  fetch-ios-chal
//
//  Created by Siddharth Jain on 7/31/24.
//

import Foundation

struct Meal: Identifiable, Codable {
    let id : String
    let name: String
    let thumbnail : String
    
    enum CodingKeys: String, CodingKey{
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
    }
}

struct MealResponse: Codable{
    let meals: [Meal]
}
