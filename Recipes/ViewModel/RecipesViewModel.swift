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
    
    var showFavoritesOnly: Bool = false
    
    var searchText = ""
    
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
                
                var matchesFavorites: Bool {
                    return !showFavoritesOnly || recipe.isFavorite
                }
                
                let matchesSearchText: Bool = searchText.isEmpty ||
                recipe.name.lowercased().contains(searchText.lowercased())
                
                return matchesDifficulty && matchesCuisine && matchesFavorites && matchesSearchText
            }
    }
    
    init(repository: RepositoryProtocol = Repository()) {
        self.repository = repository
        do {
            if FileManager.default.fileExists(atPath: repository.urlDoc.path()){
                self.recipes = try repository.getJSON()
            } else {
                let decoded: RecipesDTO = try repository.getJSON()
                self.recipes = decoded.recipes.map(\.recipe)
            }
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
    
    func toggleFavorite(recipeId: Int) {
        guard let index = recipes.firstIndex(where: { $0.id == recipeId }) else { return }
        
        recipes[index].isFavorite.toggle()
    }
    
    var savedRecipes: [Recipe] {
        recipes.filter { $0.isSaved }
    }
    
    func toggleSaved(recipeId: Int) {
        guard let index = recipes.firstIndex(where: { $0.id == recipeId }) else { return }
        
        recipes[index].isSaved.toggle()
    }
}
