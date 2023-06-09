//
//  ShoppingListItemsScreen.swift
//  GroceryApp
//
//  Created by Madalin Zaharia on 12.05.2023.
//

import RealmSwift
import SwiftUI

struct ShoppingListItemsScreen: View {
    
    // MARK: - Properties
    @ObservedRealmObject var shoppingList: ShoppingList
    @State private var isPresented: Bool = false
    @State private var selectedItemIds: [ObjectId] = []
    @State private var selectedCategory: String = "All"
    
    var items: [ShoppingItem] {
        if selectedCategory == "All" {
            return shoppingList.items.toArray()
        } else {
            return shoppingList
                .items
                .sorted(byKeyPath: "title")
                .filter { $0.category == selectedCategory }
        }
    }
    
    // MARK: - Drawing
    var body: some View {
        VStack {
            CategoryFilterView(selectedCategory: $selectedCategory)
                .padding()
            
            if items.isEmpty {
                Text("No items found.")
            } else {
                shoppingListView
            }
            
            Spacer()
        }
        .navigationTitle(shoppingList.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // action
                    isPresented = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            AddShoppingListItemScreen(shoppingList: shoppingList)
        }
    }
    
    private var shoppingListView: some View {
        List {
            ForEach(items) { item in
                NavigationLink {
                    AddShoppingListItemScreen(shoppingList: shoppingList, itemToEdit: item)
                } label: {
                    ShoppingItemCell(item: item, selected: selectedItemIds.contains(item.id)) { selected in
                        if selected {
                            selectedItemIds.append(item.id)
                            if let indexToDelete = shoppingList.items.firstIndex(where: { $0.id == item.id }) {
                                // delete the item
                                $shoppingList.items.remove(at: indexToDelete)
                            }
                        }
                    }
                }
            }
            .onDelete(perform: $shoppingList.items.remove)
        }
    }
}

struct ShoppingListItemsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShoppingListItemsScreen(shoppingList: ShoppingList())
        }
    }
}
