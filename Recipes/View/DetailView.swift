//
//  DetailView.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 14/5/25.
//

import SwiftUI

struct DetailView: View {
    
    let recipe: RecipeDataModel
    
    var body: some View {
        ScrollView {
            
            AsyncImage(url: recipe.image) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .clipped()
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 10, x: 0, y: 10)
                    .padding()
            } placeholder: {
                ProgressView()
                    .controlSize(.extraLarge)
            }
            
            Text(recipe.name)
                .font(.title)
                .bold()
                .padding()
            
            VStack (alignment: .leading, spacing: 5){
                Text("⭐️\(recipe.rating.description)")
                        .font(.caption)

                Text("🍽️ \(recipe.servings) people")
                        .font(.caption)
                
                Text("⏱️ Prep: \(recipe.prepTimeMinutes) min")
                        .font(.caption)
                
                Text("🔥 \(recipe.caloriesPerServing) cal/portion")
                        .font(.caption)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
                .padding(.horizontal)
            
            Text("Ingredients")
                .font(.headline)
                .bold()
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)

            ForEach(recipe.ingredients, id: \.self) { ingredient in
                Text("• \(ingredient)")
                    .font(.caption)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Divider()
                .padding(.horizontal)
            
            Text("Instructions")
                .font(.headline)
                .bold()
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)

            ForEach(recipe.instructions, id: \.self) { instruction in
                Text(instruction)
                    .font(.caption)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    DetailView(recipe: .preview)
}
