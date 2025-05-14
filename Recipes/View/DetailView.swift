//
//  DetailView.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 14/5/25.
//

import SwiftUI

struct DetailView: View {
    
    let recipe: Recipe
    
    var body: some View {
        Text(recipe.name)
    }
}

#Preview {
    DetailView(recipe: .preview)
}
