//
//  FoodContainerApp.swift
//  FoodContainer
//
//  Created by 최원우 on 19/8/2023.
//

import SwiftUI

@main
struct FoodContainerApp: App {
    
    var model = PersistenceHandler.shared
    @StateObject var FIFModel = FIFDmodel.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView(fifmodel:FIFModel)
        }
    }
}
