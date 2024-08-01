//
//  MealDetail.swift
//  fetch-ios-chal
//
//  Created by Siddharth Jain on 7/31/24.
//

import Foundation

struct MealDetail: Identifiable, Codable {
    
    let id: String
    let name: String
    let drinkAlternate: String?
    let category: String?
    let area: String?
    let instructions: String
    let thumbnail: String?
    let tags: String?
    let youtube: String?
    let ingredients: [String]
    let measurements: [String]
    let source: String?
    let imageSource: String?
    let creativeCommonsConfirmed: String?
    let dateModified: String?
    
    enum CodingKeys: String, CodingKey{
        case id = "idMeal"
        case name = "strMeal"
        case drinkAlternate = "strDrinkAlternate"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case thumbnail = "strMealThumb"
        case tags = "strTags"
        case youtube = "strYoutube"
        case source = "strSource"
        case imageSource = "strImageSource"
        case creativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified = "dateModified"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        drinkAlternate = try container.decodeIfPresent(String.self, forKey: .drinkAlternate)
        category = try container.decodeIfPresent(String.self, forKey: .category)
        area = try container.decodeIfPresent(String.self, forKey: .area)
        instructions = try container.decode(String.self, forKey: .instructions)
        thumbnail = try container.decodeIfPresent(String.self, forKey: .thumbnail)
        tags = try container.decodeIfPresent(String.self, forKey: .tags)
        youtube = try container.decodeIfPresent(String.self, forKey: .youtube)
        source = try container.decodeIfPresent(String.self, forKey: .source)
        imageSource = try container.decodeIfPresent(String.self, forKey: .imageSource)
        creativeCommonsConfirmed = try container.decodeIfPresent(String.self, forKey: .creativeCommonsConfirmed)
        dateModified = try container.decodeIfPresent(String.self, forKey: .dateModified)
        
        let ingredientPrefix = "strIngredient"
        let measurePrefix = "strMeasure"
        
        var ingredients: [String] = []
        var measurements: [String] = []
        
        for i in 1...20 {
            if let ingredient = try container.decodeIfPresent(String.self , forKey: CodingKeys(stringValue: "\(ingredientPrefix)\(i)")!), !ingredient.isEmpty{
                ingredients.append(ingredient)
            }
            
            if let measurement = try container.decodeIfPresent(String.self , forKey: CodingKeys(stringValue: "\(measurePrefix)\(i)")!), !measurement.isEmpty{
                measurements.append(measurement)
            }
        }
        
        self.ingredients = ingredients
        self.measurements = measurements
    }
}

struct MealDetailResponse: Codable{
    let mealDetails : [MealDetail]
}
