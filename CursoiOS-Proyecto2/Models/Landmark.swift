//
//  Landmark.swift
//  CursoiOS-Proyecto2
//
//  Created by Miguel Santiago on 19/1/22.
//

import Foundation

enum LandmarkCategory: String, Codable {
    case featured = "Featured"
    case lakes = "Lakes"
    case rivers = "Rivers"
    case mountains = "Mountains"
}


struct LandmarkCoordinate: Codable {
    let longitude: Double
    let latitude: Double
}


struct Landmark: Codable {
    let name: String
    let category: LandmarkCategory
    let city: String
    let state: String
    let id: Int
    let park: String
    let coordinates: LandmarkCoordinate
    let isFeatured: Bool
    let isFavorite: Bool
    let imageName: String
}
