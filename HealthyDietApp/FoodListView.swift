//
//  FoodListView.swift
//  HealthyDietApp
//
//  Created by Jhon Yoset Luna Quispe on 21/11/24.
//
import SwiftUI

struct FoodListView: View {
    @StateObject private var foodService = FoodService()
    @State private var searchQuery = ""
    var body: some View {
        NavigationView {
            VStack {		
                TextField("Buscar alimentos...", text: $searchQuery, onCommit: {
                    foodService.fetchFoods(query: searchQuery)
                })
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Lista de alimentos
                List(foodService.foods) { food in
                    NavigationLink(destination: FoodDetailView(food: food)) {
                        Text(food.NOMBRE)
                            .font(.headline)
                    }
                }
                .onAppear {
                    foodService.fetchFoods()
                }
            }
            .navigationTitle("Alimentos")
        }
    }
}

