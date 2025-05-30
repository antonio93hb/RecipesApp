//
//  ShopingListView.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 14/5/25.
//

import SwiftUI
import SwiftData

struct ShoppingListView: View {
        
    @Environment(\.modelContext) private var context
    @Query private var shoppingList: [ProductDB]
    @State private var newItem: String = ""
    
    var body: some View {
        
        VStack{
            Text("🛒 Shopping List")
                .font(.title)
                .bold()
            
            HStack{
                TextField("Add item...", text: $newItem)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading)
                
                Button{
                    guard !newItem.isEmpty else { return }
                    let newProduct = ProductDB(name: newItem, isCompleted: false)
                    context.insert(newProduct)
                    newItem = ""
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.green)
                }
            }
            .padding(.horizontal, 10)
            
            if shoppingList.isEmpty {
                VStack(spacing: 8) {
                    
                    Image(systemName: "cart")
                        .font(.system(size: 60))
                        .foregroundStyle(.gray.opacity(0.5))
                    
                    Text("Your shopping list is empty")
                        .foregroundStyle(.secondary)
                }
                .frame(maxHeight: .infinity)
                
            } else {
                List{
                    ForEach(shoppingList) { item in
                        Button {
                            item.isCompleted.toggle()
                        } label: {
                            HStack {
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(item.isCompleted ? .green : .gray)
                                
                                Text(item.name)
                                    .strikethrough(item.isCompleted)
                                    .foregroundStyle(item.isCompleted ? .gray : .primary)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            let itemToDelete = shoppingList[index]
                            context.delete(itemToDelete)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ShoppingListView()
        .preview
        .environment(ShoppingListViewModel())
}
