//
//  PreviewViews.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 14/5/25.
//

import SwiftUI

extension View {
    var preview: some View {
        self.environment(RecipesViewModel(repository: RepositoryTest()))
    }
}
