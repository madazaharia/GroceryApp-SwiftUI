//
//  ShoppingList.swift
//  GroceryApp
//
//  Created by Madalin Zaharia on 12.05.2023.
//

import Foundation
import RealmSwift

class ShoppingList: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var address: String
    @Persisted var items: List<ShoppingItem> = List<ShoppingItem>()
}
