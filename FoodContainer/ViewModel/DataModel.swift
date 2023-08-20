//
//  DataModel.swift
//  FoodContainer
//
//  Created by 최원우 on 20/8/2023.
//

import Foundation
import CoreData


class FIFDmodel: ObservableObject{
    @Published var name = ""
    @Published var date = ""
    @Published var note = ""
    @Published var quantity = 0
    @Published var category = ""

    static let shared = FIFDmodel()
    init(){
        
    }
}
