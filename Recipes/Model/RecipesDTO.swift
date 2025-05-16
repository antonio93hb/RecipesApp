//
//  RecipesDTO.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 16/5/25.
//

import Foundation

struct RecipesDTO: Codable {
    let recipes: [RecipeDTO]
    let total: Int
    let skip: Int
    let limit: Int
}

struct RecipeDTO: Codable {
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
    
    var recipe: Recipe {
        Recipe(
            id: id,
            name: name,
            ingredients: ingredients,
            instructions: instructions,
            prepTimeMinutes: prepTimeMinutes,
            cookTimeMinutes: cookTimeMinutes,
            servings: servings,
            difficulty: difficulty,
            cuisine: cuisine,
            caloriesPerServing: caloriesPerServing,
            tags: tags,
            userId: userId,
            image: image,
            rating: rating,
            reviewCount: reviewCount,
            mealType: mealType,
            isFavorite: false
        )
    }
}
