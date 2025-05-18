//
//  ContentView.swift
//  Recets
//
//  Created by Antonio Hernández Barbadilla on 12/5/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(RecipesViewModel.self) private var recipesViewModel
    @State private var shoppingListViewModel = ShoppingListViewModel()
    @State private var timerViewModel = TimerViewModel()
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
                    .environment(shoppingListViewModel)
            }
            Tab("Timer", systemImage: "timer") {
                TimerView()
                    .environment(timerViewModel)
            }
        }
    }
}

#Preview {
    ContentView()
        .preview
}
