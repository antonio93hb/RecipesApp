//
//  ViewModel.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 12/5/25.
//

import Foundation

@Observable
class ViewModel {
    private let interactor = RecipesInteractor()
    
    var recipes: [Recipe] = []
    
    init() {
        loadRecipes()
    }
    
    private func loadRecipes() {
        self.recipes = interactor.loadRecipes()
    }
}
