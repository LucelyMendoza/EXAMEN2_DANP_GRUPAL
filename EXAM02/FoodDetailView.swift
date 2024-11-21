import SwiftUI

struct FoodDetailView: View {
    let food: Food

    var body: some View {
        VStack(spacing: 20) {
            Text(food.nombre)
                .font(.largeTitle)
                .padding(.top)
            Text("Categoría: \(food.categoria)")
                .font(.title2)
                .foregroundColor(.gray)
            HStack {
                VStack(alignment: .leading) {
                    Text("Proteína: \(food.proteina, specifier: "%.1f") g")
                    Text("Grasa: \(food.grasa, specifier: "%.1f") g")
                    Text("Carbohidrato: \(food.carbohidrato, specifier: "%.1f") g")
                    Text("Energía: \(food.energia, specifier: "%.1f") kcal")
                }
                .font(.body)
            }
            .padding()
            Spacer()
        }
        .navigationTitle("Detalles")
        .padding()
    }
}

