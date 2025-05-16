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
                                        print("Favorite \(recipe.name)")
                                        recipesViewModel.toggleFavorite(recipeId: recipe.id)
                                    } label: {
                                        Label("Favorite", systemImage: "heart")
                                    }
                                    .tint(.red)
                                    Button {
                                        // Acción para guardar receta
                                        print("Saved \(recipe.name)")
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
            }
        }
    }
}

#Preview {
    RecipesListView()
        .preview
}
