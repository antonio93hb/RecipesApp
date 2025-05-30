//
//  ProductDB.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 21/5/25.
//

import Foundation
import SwiftData

@Model
final class ProductDB {
    @Attribute(.unique) var id: UUID
    var name : String
    var isCompleted: Bool
    
    init(name: String, isCompleted: Bool) {
        self.id = UUID()
        self.name = name
        self.isCompleted = isCompleted
    }
}
