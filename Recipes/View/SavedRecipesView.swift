//
//  SavedRecipesView.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 14/5/25.
//

import SwiftUI

struct SavedRecipesView: View {
    
    @Environment(RecipesViewModel.self) private var recipesViewModel

    
    var body: some View {
        NavigationStack {
            if recipesViewModel.savedRecipes.isEmpty {
                Text("No saved recipes yet!")
            } else {
                List(recipesViewModel.savedRecipes) { recipe in
                    NavigationLink(
                        destination: DetailView(recipe: recipe)
                    ) {
                        RecipeRow(recipe: recipe)
                    }
                }
                .navigationTitle("Saved Recipes")
            }

        }
    }
}

#Preview {
    SavedRecipesView()
}
