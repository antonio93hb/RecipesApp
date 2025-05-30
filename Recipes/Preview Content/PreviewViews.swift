//
//  PreviewViews.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 14/5/25.
//

import SwiftUI
import SwiftData

extension View {
    var preview: some View {
        self
            .environment(RecipesViewModel(repository: RepositoryTest()))
            .modelContainer(Self.previewContainer)
    }

    private static var previewContainer: ModelContainer {
        do {
            let schema = Schema([ProductDB.self])
            let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
            return try ModelContainer(for: schema, configurations: configuration)
        } catch {
            fatalError("No se pudo crear el container en preview: \(error)")
        }
    }
}
