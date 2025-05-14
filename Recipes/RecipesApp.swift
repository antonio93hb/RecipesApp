//
//  RecetsApp.swift
//  Recets
//
//  Created by Antonio Hernández Barbadilla on 12/5/25.
//

import SwiftUI

@main
struct RecipesApp: App {
    
    @State private var recipesViewModel = RecipesViewModel()
    
    var body: some Scene {
        WindowGroup {
            WellcomeView()
                .environment(recipesViewModel)
        }
    }
}
