//
//  GroceryAppApp.swift
//  GroceryApp
//
//  Created by Madalin Zaharia on 12.05.2023.
//

import SwiftUI

@main
struct GroceryAppApp: App {
    
    let migrator = Migrator()
    
    var body: some Scene {
        WindowGroup {
            // hide all the constraints errors that will be display due to SwiftUI in all dependencies
            let _ = UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            
            // display the `path` for the document directory
            // here we can find the Realm file for our database and we check out the content of the database
            //let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            
            ContentView()
        }
    }
}
