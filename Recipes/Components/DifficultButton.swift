//
//  DifficultButton.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 14/5/25.
//

import SwiftUI

enum DifficultOption: String, CaseIterable, Identifiable {
    case all = "All"
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    
    var id: Self { self }
}

struct DifficultButton: ViewModifier {
    
    @Binding var difficultOption: DifficultOption
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        ForEach(DifficultOption.allCases) { difficult in
                            Button {
                                difficultOption = difficult
                            } label: {
                                Text(difficult.rawValue)
                            }
                        }
                    } label: {
                        Text(difficultOption.rawValue)
                    }
                }
            }
    }
}

extension View {
    func difficultButton(difficultOption: Binding<DifficultOption>) -> some View {
        modifier(DifficultButton(difficultOption: difficultOption))
    }
}

#Preview {
    @Previewable @State var difficultOption: DifficultOption = .all
    
    NavigationStack {
        List {
            Text(difficultOption.rawValue)
        }
        .difficultButton(difficultOption: $difficultOption)
    }
}
