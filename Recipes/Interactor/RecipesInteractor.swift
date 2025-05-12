//
//  RecetsInteractor.swift
//  Recets
//
//  Created by Antonio Hernández Barbadilla on 12/5/25.
//

import SwiftUI

final class RecipesInteractor {
    
    func loadRecipes() -> [Recipe] {
        
        guard let url = Bundle.main.url(forResource: "recipes_formatted", withExtension: "json") else {
            print("No se encontró el archivo JSON")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(Recipes.self, from: data)
            return decoded.recipes
            
        } catch {
            print("Error al cargar el JSON: \(error)")
            return []
        }
    }
}


