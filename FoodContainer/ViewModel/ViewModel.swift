//
//  ViewModel.swift
//  FoodContainer
//
//  Created by 최원우 on 20/8/2023.
//

import Foundation
import CoreData

import SwiftUI

extension FIF{
    
    var strName:String{
        get{
            self.name ?? "New Product"
        }set{
            self.name=newValue
        }
    }
    
    var strQuantity:String{
        get{
            "\(self.quantity)"
        }set{
            guard let quantity = Int64(newValue)else{
                return
            }
            self.quantity=quantity
        }
    }
    var strNote:String{
        get{
            self.note ?? "New Note"
        }set{
            self.note=newValue
        }
    }
    var strCategory:String{
        get{
            self.category ?? "category"
        }set{
            self.category=newValue
        }
    }
    var strDate: String {
           get {
               let dateFormatter = DateFormatter()
               dateFormatter.dateFormat = "yyyy-MM-dd HH"
               if let actualDate = self.date {
                   return dateFormatter.string(from: actualDate)
               } else {
                   return ""
               }
           }
           set {
               let dateFormatter = DateFormatter()
               dateFormatter.dateFormat = "yyyy-MM-dd HH"
               if let newDate = dateFormatter.date(from: newValue) {
                   self.date = newDate
               }
           }
       }
    var rowDisplay:String {
        "Name: \(self.strName) || Date: \(self.strDate)"
    }
    
}

func saveData(){
    let ctx = PersistenceHandler.shared.container.viewContext
    do{
        try ctx.save()
    }catch{
        fatalError("Error in save data with \(error)")
    }
}

func addFood(){
    let ctx = PersistenceHandler.shared.container.viewContext
    @FetchRequest(entity:FIF.entity() ,sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    var FIFs:FetchedResults<FIF>
    let fif = FIF(context:ctx)
    fif.name="New"
    fif.note=""
    fif.quantity=0
    fif.category=""
    // get date when the function activated//
    let currentDate = Date()
    let calendar = Calendar.current
    let dateComponents = calendar.dateComponents([.year, .month, .day, .hour], from: currentDate)
    if let extractedDate = calendar.date(from: dateComponents) {
        fif.date = extractedDate
    }
    // get date when the function activated//

    saveData()
    
}

func removeFood(FIFs:[FIF]){
    let ctx = PersistenceHandler.shared.container.viewContext
    FIFs.forEach{
        ctx.delete($0)
    }
    saveData()
}
