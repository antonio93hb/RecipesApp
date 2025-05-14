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
        
    }
}
