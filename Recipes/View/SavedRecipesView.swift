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
                VStack(spacing: 16){
                    Image(systemName: "bookmark.slash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(.gray.opacity(0.5))
                    Text("No saved recipes yet.")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                    Text("Swipe on a recipe to save it for later.")
                        .font(.subheadline)
                        .foregroundStyle(.gray.opacity(0.6))
                        .padding(.horizontal, 30)
                }
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
        .preview
}
