//
//  ContentView.swift
//  GroceryApp
//
//  Created by Madalin Zaharia on 12.05.2023.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    // MARK: - Properties
    @ObservedResults(ShoppingList.self) var shoppingLists
    @State private var isPresented: Bool = false
    
    // MARK: - Drawing
    var body: some View {
        NavigationView {
            VStack {
                if shoppingLists.isEmpty {
                    Text("No shopping lists!")
                } else {
                    List {
                        ForEach(shoppingLists, id: \.id) { shoppingList in
                            NavigationLink {
                                ShoppingListItemsScreen(shoppingList: shoppingList)
                            } label: {
                                VStack(alignment: .leading) {
                                    Text(shoppingList.title)
                                    Text(shoppingList.address)
                                        .opacity(0.4)
                                }
                            }
                        }
                        .onDelete(perform: $shoppingLists.remove)
                    }
                }
            }
            .navigationTitle("Grocery App")
            .sheet(isPresented: $isPresented) {
                AddShoppingListScreen()
            }
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
