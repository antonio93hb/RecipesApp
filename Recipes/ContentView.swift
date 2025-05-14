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
            Tab("Saved", systemImage: "list.bullet") {
                EmptyView()
            }
            Tab("Shopping List", systemImage: "list.bullet") {
                EmptyView()
            }
            Tab("Timer", systemImage: "list.bullet") {
                EmptyView()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ContentView()
        //.environment(RecipesViewModel())
        .preview
}
