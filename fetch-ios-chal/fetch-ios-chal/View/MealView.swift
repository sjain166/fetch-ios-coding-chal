//
//  MealView.swift
//  fetch-ios-chal
//
//  Created by Siddharth Jain on 7/31/24.
//

import SwiftUI

struct MealView: View {
    @StateObject private var viewModel = MealViewModel.shared
    
    var body: some View{
        NavigationView{
            List(viewModel.meals) {meal in
                NavigationLink(destination: MealDetailView(mealId: meal.id)){
                    HStack{
                        AsyncImage(url: URL(string: meal.thumbnail)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        Text(meal.name)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Desserts")
            .task{
                await viewModel.fetchMeals()
            }
        }
    }
}

#Preview {
    MealView()
}
