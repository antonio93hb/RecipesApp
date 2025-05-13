//
//  RecipesListView.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 12/5/25.
//

import SwiftUI

struct RecipesListView: View {
    
    @Environment(RecipesViewModel.self) private var recipesModel

    var body: some View {
        List(recipesModel.recipes) { recipe in
            Text(recipe.name)
        }
    }
}

#Preview {
    RecipesListView()
        .environment(RecipesViewModel())
}
