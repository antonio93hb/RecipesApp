//
//  ContentView.swift
//  Recets
//
//  Created by Antonio Hernández Barbadilla on 12/5/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(RecipesViewModel.self) private var recipesViewModel
    var body: some View {
        TabView {
            Tab("Recipes", systemImage: "list.bullet") {
                RecipesListView()
            }
            Tab("Saved", systemImage: "bookmark") {
                SavedRecipesView()
            }
            Tab("Shopping List", systemImage: "cart") {
                ShoppingListView()
            }
            Tab("Timer", systemImage: "timer") {
                TimerView()
            }
        }
    }
}

#Preview {
    ContentView()
        .preview
}
