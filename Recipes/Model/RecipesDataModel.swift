//
//  DataModel.swift
//  Recets
//
//  Created by Antonio Hernández Barbadilla on 12/5/25.
//

import Foundation

struct RecipesDataModel: Codable {
    let recipes: [RecipeDataModel]
    let total: Int
    let skip: Int
    let limit: Int
}

struct RecipeDataModel: Codable, Identifiable {
    let id: Int
    let name: String
    let ingredients: [String]
    let instructions: [String]
    let prepTimeMinutes: Int
    let cookTimeMinutes: Int
    let servings: Int
    let difficulty: String
    let cuisine: String
    let caloriesPerServing: Int
    let tags: [String]
    let userId: Int
    let image: URL
    let rating: Float
    let reviewCount: Int
    let mealType: [String]
    var isFavorite: Bool
    var isSaved: Bool
}
