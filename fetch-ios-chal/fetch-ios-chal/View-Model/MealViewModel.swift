//
//  MealViewModel.swift
//  fetch-ios-chal
//
//  Created by Siddharth Jain on 7/31/24.
//

import Foundation

class MealViewModel: ObservableObject{
    
    @Published var meals: [Meal] = []
    @Published var selectedMealDetail: MealDetail?
    
    static let shared = MealViewModel()
    private init() {}
    
    private let baseURL = "https://www.themealdb.com/api/json/v1/1/"
    private let mealSuffix = "filter.php?c=Dessert"
    private let mealDetailSuffix = "lookup.php?i="
    
    func fetchMeals() async {
        guard let url = URL(string: "\(baseURL)\(mealSuffix)") else { return }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(MealResponse.self , from: data)
            DispatchQueue.main.async {
                self.meals = response.meals.sorted {$0.name < $1.name}
            }
        }
        
        catch{
            print("Error fetching meals: \(error.localizedDescription)")
        }
    }
    
    func fetchMealDetail(by id : String) async{
        guard let url = URL(string: "\(baseURL)\(mealDetailSuffix)\(53049)") else { return }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(MealDetailResponse.self, from: data)
            DispatchQueue.main.async {
                self.selectedMealDetail = response.meals.first
            }
        }
        
        catch{
            print("Error fetching meal detail \(id): \(error.localizedDescription)")
        }
    }
    
}
