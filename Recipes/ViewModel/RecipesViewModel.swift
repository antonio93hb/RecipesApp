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
    
    var countryCuisineOption: CuisineType = .all
    
    var filteredRecipes: [Recipe] {
        recipes
            .filter { recipe in
                let matchesDifficulty: Bool = {
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
                }()
                
                let matchesCuisine: Bool = {
                    switch countryCuisineOption {
                    case .all:
                        return true
                    case .italian:
                        return recipe.cuisine.lowercased() == "italian"
                    case .mexican:
                        return recipe.cuisine.lowercased() == "mexican"
                    case .indian:
                        return recipe.cuisine.lowercased() == "indian"
                    case .japanese:
                        return recipe.cuisine.lowercased() == "japanese"
                    case .spanish:
                        return recipe.cuisine.lowercased() == "spanish"
                        
                    }
                }()
                return matchesDifficulty && matchesCuisine
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
