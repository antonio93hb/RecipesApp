//
//  recipeRow.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 14/5/25.
//

import SwiftUI

struct RecipeRow: View {
    
    let recipe: Recipe
    
    var body: some View {
        HStack(spacing: 8){
            AsyncImage(url: recipe.image) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 75)
            } placeholder: {
                ProgressView()
                    .controlSize(.extraLarge)
            }
            
            VStack(alignment: .leading, spacing: 4){
                Text(recipe.name)
                    .font(.headline)
                
                HStack(spacing: 4){
                    Text("⏱️ \(recipe.prepTimeMinutes + recipe.cookTimeMinutes) min")
                    Divider()
                        .frame(height: 20)
                    Text("🍽️ \(recipe.servings) portions")
                }
                .font(.caption)
                .bold()
                .foregroundStyle(.gray)
                
                HStack{
                    if recipe.isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    
                    if recipe.isSaved {
                        Image(systemName: "bookmark.fill")
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

#Preview {
    List {
        RecipeRow(recipe: .preview)
    }
}
