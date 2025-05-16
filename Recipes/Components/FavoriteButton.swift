//
//  DifficultButton.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 14/5/25.
//

import SwiftUI

struct FavoriteButton: ViewModifier {
    
    @Binding var isFavorite: Bool
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isFavorite.toggle()
                    } label: {
                        HStack {
                            Image(systemName: isFavorite ? "star.fill" : "star.slash")
                            Text("Favorites")
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.yellow.opacity(0.2))
                        .foregroundStyle(.purple)
                        .clipShape(Capsule())
                    }
                }
            }
    }
}

extension View {
    func favoriteButton(isFavorite: Binding<Bool>) -> some View {
        modifier(FavoriteButton(isFavorite: isFavorite))
    }
}

#Preview {
    
    @Previewable @State var isFavorite = false
    
    NavigationStack {
        List {
            Text(isFavorite ? "Favoritos activados" : "Todos los elementos")
        }
        .favoriteButton(isFavorite: $isFavorite)
    }
}
