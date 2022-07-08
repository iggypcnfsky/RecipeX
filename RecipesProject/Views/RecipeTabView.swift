//
//  RecipeTabView.swift
//  RecipeX
//
//  Created by Iggy Pacanowski on 08/07/2022.
//

import SwiftUI

struct RecipeTabView: View {
    
    @State var tabIndex = 1
    
    var body: some View {
        
        TabView (selection: $tabIndex){
            
            //TAB 1 -- FEATURED
            Text("Featured View")
                .tabItem {
                    VStack{
                        
                        Image(systemName: "star")
                        Text("Featured")
                        
                    }
                }.tag(0)
            
            
            //TAB 2 -- ALL RECIPES
            ContentView()
                .tabItem {
                    VStack{
                        
                        Image(systemName: "list.dash")
                        Text("All recipes")
                }
            
                }
                .tag(1)
            
        }
        
        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
