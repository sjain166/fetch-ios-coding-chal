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
        Text("Meals")
    }
}

#Preview {
    MealView()
}
