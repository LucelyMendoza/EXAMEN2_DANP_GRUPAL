import Foundation

struct Food: Identifiable, Codable {
    var id: Int
    var nombre: String
    var categoria: String
    var proteina: Double
    var grasa: Double
    var carbohidrato: Double
    var energia: Double

    enum CodingKeys: String, CodingKey {
        case id = "codigo"
        case nombre
        case categoria
        case proteina
        case grasa
        case carbohidrato
        case energia
    }
}



