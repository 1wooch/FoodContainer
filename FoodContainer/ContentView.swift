//
//  ContentView.swift
//  FoodContainer
//
//  Created by 최원우 on 19/8/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
//    @Environment(\.managedObjectContext) var ctx
//
//    @FetchRequest(entity: FIF.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
//
//
//    @ObservedObject var FIFModel:FIFDmodel
    
    @Environment(\.managedObjectContext) var ctx

    @FetchRequest(entity: FIF.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \FIF.name, ascending: true)])
    
    var fifs:FetchedResults<FIF>

    @ObservedObject var fifmodel:FIFDmodel
    
    var body: some View {
        VStack {
            NavigationView{
                VStack{
                    List{
                        NavigationLink(destination: FAYview())
                        {
                            Text("Food Around You")
                        }
                    }
                }
            }
            
          
        }
        .padding()
    }
}


