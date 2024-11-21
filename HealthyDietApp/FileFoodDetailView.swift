//
//  FileFoodDetailView.swift
//  HealthyDietApp
//
//  Created by Jhon Yoset Luna Quispe on 21/11/24.
//

import SwiftUI

struct FoodDetailView: View {
    let food: Food
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(food.NOMBRE)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Categoría: \(food.CATEGORIA)")
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Proteína: \(food.PROTEINA, specifier: "%.2f") g")
                Text("Grasa: \(food.GRASA, specifier: "%.2f") g")
                Text("Carbohidratos: \(food.CARBOHIDRATO, specifier: "%.2f") g")
                Text("Energía: \(food.ENERGIA, specifier: "%.2f") kcal")
            }
            .padding(.top, 10)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Detalles")
    }
}
