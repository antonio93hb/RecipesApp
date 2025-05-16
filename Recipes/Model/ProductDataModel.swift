//
//  ProductDataModel.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 16/5/25.
//

import Foundation

struct ProductDataModel: Identifiable {
    let name: String
    let id = UUID()
    var isCompleted: Bool
}
