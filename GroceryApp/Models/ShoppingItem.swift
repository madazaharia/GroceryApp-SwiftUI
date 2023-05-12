//
//  ShoppingItem.swift
//  GroceryApp
//
//  Created by Madalin Zaharia on 12.05.2023.
//

import Foundation
import RealmSwift

class ShoppingItem: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var quantity: Int
    @Persisted var category: String
}
