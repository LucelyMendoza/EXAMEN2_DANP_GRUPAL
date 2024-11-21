import Foundation
class FoodService: ObservableObject {
    @Published var foods: [Food] = []
    func fetchFoods() {
        guard let url = URL(string: "http://127.0.0.1:5000/foods") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Datos JSON: \(jsonString)")
                }

                do {
                    let cleanedData = self.removeBOM(from: data)

                    let decodedFoods = try JSONDecoder().decode([Food].self, from: cleanedData)
                    DispatchQueue.main.async {
                        self.foods = decodedFoods
                    }
                } catch {
                    print("Error al decodificar los datos: \(error)")
                }
            } else if let error = error {
                print("Error en la solicitud: \(error)")
            }
        }.resume()
    }
    private func removeBOM(from data: Data) -> Data {
        var cleanedData = data
        let bom: [UInt8] = [0xEF, 0xBB, 0xBF]
        if cleanedData.starts(with: bom) {
            cleanedData.removeFirst(3)
        }
        return cleanedData
    }
}



