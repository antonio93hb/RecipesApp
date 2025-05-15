//
//  CountryButton.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 15/5/25.
//

import SwiftUI

enum CuisineType: String, CaseIterable, Identifiable {
    case all = "🌍 All"
    case italian = "🇮🇹 Italian"
    case mexican = "🇲🇽 Mexican"
    case indian = "🇮🇳 Indian"
    case japanese = "🇯🇵 Japanese"
    case spanish = "🇪🇸 Spanish"
    
    var id: String { rawValue }
}

struct CountryButton: View {
    
    @Binding var selectedCuisine: CuisineType
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(CuisineType.allCases, id: \.self) { cuisine in
                    Button {
                        selectedCuisine = cuisine
                    } label: {
                        Text(cuisine.rawValue)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background( selectedCuisine == cuisine ? Color.blue.opacity(0.2) : Color.gray.opacity(0.2))
                    .foregroundStyle(selectedCuisine == cuisine ? .blue : .black)
                    .clipShape(Capsule())
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    @Previewable @State var selectedCuisine: CuisineType = .all

    CountryButton(selectedCuisine: $selectedCuisine)
        
}
