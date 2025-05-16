//
//  ShopingListView.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 14/5/25.
//

import SwiftUI

struct ShoppingListView: View {
    
    @Environment(ShoppingListViewModel.self) private var shoppingListViewModel
    
    var body: some View {
        
        VStack{
            @Bindable var shoppingListViewModelBindable = shoppingListViewModel

            Text("🛒 Shopping List")
                .font(.title)
                .bold()
            
            HStack{
                
                TextField("Add item...", text: $shoppingListViewModelBindable.newItem)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading)
                
                Button{
                    shoppingListViewModel.addItem()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.green)
                }
            }
            .padding(.horizontal, 10)
            
            if shoppingListViewModel.shoppingList.isEmpty {
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
                    ForEach(shoppingListViewModel.shoppingList) { item in
                        Button {
                            shoppingListViewModel.toggleItemCompletion(item: item)
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
                    .onDelete(perform: shoppingListViewModel.deleteItem)
                }
            }
        }
    }
}

#Preview {
    ShoppingListView()
        .environment(ShoppingListViewModel())
}
