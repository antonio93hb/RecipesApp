//
//  RecipesListView.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 12/5/25.
//

import SwiftUI

struct RecipesListView: View {
    
    @Environment(RecipesViewModel.self) private var recipesViewModel
    @State private var selectedCuisine: CuisineType = .all
    @State private var showFavoritesOnly: Bool = false
    
    var body: some View {
        NavigationStack {
            
            @Bindable var recipesViewModelb = recipesViewModel
            
            VStack {
                CountryButton(selectedCuisine: $recipesViewModelb.countryCuisineOption)

                List{
                    ForEach(recipesViewModel.filteredRecipes) { recipe in
                        
                        NavigationLink(
                            destination: DetailView(recipe: recipe)
                        ) {
                            RecipeRow(recipe: recipe)
                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                    Button {
                                        // Acción para marcar como favorito
                                        recipesViewModel.toggleFavorite(recipeId: recipe.id)
                                    } label: {
                                        Label("Favorite", systemImage: "star")
                                    }
                                    .tint(.yellow)
                                    Button {
                                        // Acción para guardar receta
                                        print("Saved \(recipe.name)")
                                        recipesViewModel.toggleSaved(recipeId: recipe.id)
                                    } label: {
                                        Label("Save", systemImage: "bookmark")
                                    }
                                    .tint(.blue)
                                }
                        }
                    }
                    //.onDelete(perform: recipesViewModel.deleteRecipe(at:))
                    .listStyle(.automatic)
                }
                .navigationTitle("Recipes")
                .difficultButton(difficultOption: $recipesViewModelb.difficultOption)
                .favoriteButton(isFavorite: $recipesViewModelb.showFavoritesOnly)
            }
        }
    }
}

#Preview {
    RecipesListView()
        .preview
}
