//
//  MealDetailView.swift
//  fetch-ios-chal
//
//  Created by Siddharth Jain on 7/31/24.
//

import SwiftUI

struct MealDetailView: View {
    @StateObject private var viewModel = MealViewModel.shared
    let mealId: String
    
    var body: some View {
        VStack{
            if let mealDetail = viewModel.selectedMealDetail{
                Text(mealDetail.name)
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .padding()
                    
                Text("Instructions")
                    .font(.title)
                    .padding()
                Text(mealDetail.instructions)
                    .padding()
                
                Text("Ingredients")
                    .font(.title)
                    .padding()
                List{
                    ForEach(Array(zip(mealDetail.ingredients, mealDetail.measurements)), id: \.0){
                        ingredient, measurement in
                        HStack{
                            Text(ingredient)
                            Spacer()
                            Text(measurement)
                        }
                    }
                }
            }
            
            else{
                ProgressView()
            }
        }
        .onAppear{
            Task{
                await viewModel.fetchMealDetail(by: mealId)
            }
        }
        .navigationTitle("Meal Detail View")
    }
}

#Preview {
    MealDetailView(mealId: "53049")
}
