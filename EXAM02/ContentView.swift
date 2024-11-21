import SwiftUI
struct ContentView: View {
    @StateObject private var foodService = FoodService()
    @State private var searchText = ""

    var filteredFoods: [Food] {
        if searchText.isEmpty {
            return foodService.foods
        } else {
            return foodService.foods.filter {
                $0.nombre.lowercased().contains(searchText.lowercased()) ||
                $0.categoria.lowercased().contains(searchText.lowercased())
            }
        }
    }
    var body: some View {
        NavigationView {
            List(filteredFoods) { food in
                NavigationLink(destination: FoodDetailView(food: food)) {
                    VStack(alignment: .leading) {
                        Text(food.nombre)
                            .font(.headline)
                        Text(food.categoria)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Alimentos")
            .searchable(text: $searchText)
            .onAppear {
                foodService.fetchFoods()
            }
        }
    }
}

