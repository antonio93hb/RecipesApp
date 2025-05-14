//
//  RecipesListView.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 12/5/25.
//

import SwiftUI

struct RecipesListView: View {
    
    @Environment(RecipesViewModel.self) private var recipesViewModel
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(recipesViewModel.recipes) { recipe in
                    
                    NavigationLink(
                        destination: DetailView(recipe: recipe)
                    ) {
                        RecipeRow(recipe: recipe)
                    }
                }
                .onDelete(perform: recipesViewModel.deleteRecipe(at:))
                //.onMove(perform: <#((IndexSet, Int) -> Void)?#>)
                
            }
            .navigationTitle("Recipes")
        }
    }
}

#Preview {
    RecipesListView()
    //.environment(RecipesViewModel())
        .preview
}
