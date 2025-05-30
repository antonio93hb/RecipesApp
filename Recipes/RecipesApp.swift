//
//  RecetsApp.swift
//  Recets
//
//  Created by Antonio Hernández Barbadilla on 12/5/25.
//

import SwiftUI
import SwiftData

@main
struct RecipesApp: App {
    
    @State private var recipesViewModel = RecipesViewModel()
    
    var sharedModelContainer: ModelContainer {
        
        let schema = Schema([ProductDB.self])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: modelConfiguration)
        } catch {
            fatalError("No se pudo crear el model container: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            WellcomeView()
                .environment(recipesViewModel)
                .modelContainer(sharedModelContainer)
        }
    }
}
