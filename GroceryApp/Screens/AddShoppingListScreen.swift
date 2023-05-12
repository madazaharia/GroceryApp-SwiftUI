//
//  AddShoppingListScreen.swift
//  GroceryApp
//
//  Created by Madalin Zaharia on 12.05.2023.
//

import RealmSwift
import SwiftUI

struct AddShoppingListScreen: View {
    
    // MARK: - Properties
    @State private var title: String = ""
    @State private var address: String = ""
    
    @ObservedResults(ShoppingList.self) var shoppingLists
    
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Drawing
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter title", text: $title)
                TextField("Enter address", text: $address)
                
                saveButton
            }
            .navigationTitle("New List")
        }
    }
    
    private var saveButton: some View {
        Button {
            // create a shopping list record
            let shoppingList = ShoppingList()
            shoppingList.title = title
            shoppingList.address = address
            $shoppingLists.append(shoppingList)
            
            dismiss()
        } label: {
            Text("Save")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.bordered)
    }
}

struct AddShoppingListScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddShoppingListScreen()
    }
}
