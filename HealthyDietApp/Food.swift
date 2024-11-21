//
//  Food.swift
//  HealthyDietApp
//
//  Created by Jhon Yoset Luna Quispe on 21/11/24.
import Foundation

struct Food: Identifiable, Codable {
    var id: UUID { UUID() }
    let CODIGO: Int
    let NOMBRE: String
    let CATEGORIA: String
    let PROTEINA: Double
    let GRASA: Double
    let CARBOHIDRATO: Double
    let ENERGIA: Double
}


