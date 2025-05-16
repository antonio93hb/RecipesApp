//
//  ShoppingListViewModel.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 16/5/25.
//

import Foundation

@Observable
final class ShoppingListViewModel {
    
    var productsShoppingList: [ProductDataModel]
    
    var shoppingList: [ProductDataModel]
    
    var newItem: String = ""
    
    init() {
        self.shoppingList = []
        self.productsShoppingList = []
        self.newItem = ""
    }
    
    // MARK: - Actions

    func addItem() {
        guard !newItem.isEmpty else { return }
        let newProduct: ProductDataModel = ProductDataModel(name: newItem, isCompleted: false)
        shoppingList.append(newProduct)
        self.newItem = ""
    }
    
    func deleteItem(at offsets: IndexSet) {
        for index in offsets {
            shoppingList.remove(at: index)
        }
    }
    
    func toggleItemCompletion(item: ProductDataModel) {
        guard let index = shoppingList.firstIndex(where: { $0.id == item.id }) else { return }
        shoppingList[index].isCompleted.toggle()
    }
    
}
