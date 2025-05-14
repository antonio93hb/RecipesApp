//
//  RecipesViewModel.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 12/5/25.
//

import SwiftUI
import Foundation

@Observable
final class RecipesViewModel {
    
    let repository: RepositoryProtocol
    
    var recipes: [Recipe]
    
    var difficultOption: DifficultOption = .all
    
    var filteredRecipes: [Recipe] {
        recipes
            .filter { recipe in
            switch difficultOption {
            case .all:
                return true
            case .easy:
                return recipe.difficulty.lowercased() == "easy"
            case .medium:
                return recipe.difficulty.lowercased() == "medium"
            case .hard:
                return recipe.difficulty.lowercased() == "hard"
            }
        }
    }
    
    init(repository: RepositoryProtocol = Repository()) {
        self.repository = repository
        do {
            let decoded: Recipes = try repository.getJSON()
            self.recipes = decoded.recipes
        } catch {
            fatalError("No se pudieron cargar las recetas: \(error)")
        }
    }
    
    // MARK: - Actions
    
    func deleteRecipe(at offsets: IndexSet) {
        for index in offsets {
            recipes.remove(at: index)
        }
    }
}
