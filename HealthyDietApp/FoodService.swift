//
//  FoodService.swift
//  HealthyDietApp
//
//  Created by Jhon Yoset Luna Quispe on 21/11/24.
//
//let baseURL = "http://192.168.218.1/HealthyAPI/api/data"

import Foundation

class FoodService: ObservableObject {
    @Published var foods: [Food] = [] // Lista de alimentos
    
    func fetchFoods(query: String = "") {
        // Construir URL con parámetros de búsqueda
        let baseURL = "http://192.168.218.1:3000/api/data"
        let urlString = query.isEmpty ? baseURL : "\(baseURL)?query=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
        
        guard let url = URL(string: urlString) else { return }
        
        // Crear tarea de red
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let decodedFoods = try JSONDecoder().decode([Food].self, from: data)
                        self.foods = decodedFoods
                    } catch {
                        print("Error al decodificar datos: \(error)")
                    }
                }
            } else if let error = error {
                print("Error de red: \(error)")
            }
        }.resume()
    }
}

