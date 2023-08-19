//
//  Persistance.swift
//  FoodContainer
//
//  Created by 최원우 on 20/8/2023.
//

import CoreData
struct PersistenceHandler {
    static let shared = PersistenceHandler()
    let container: NSPersistentContainer
    init() {
        container = NSPersistentContainer(name: "FMSDB")
        container.loadPersistentStores { _, error in
            if let e = error {
                fatalError("Error in load data \(e).")
            }
        }
    }
}
 
