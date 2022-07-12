//
//  ContentView.swift
//  RecipesProject
//
//  Created by Iggy Pacanowski on 05/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    
    //    @ObservedObject var model = RecipeModel()
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            
            VStack(alignment: .leading) {
                
                
                Text("All Recipes")
                    .bold()
                    .font(.largeTitle)
                
                ScrollView {
                    
                    LazyVStack(alignment: .leading) {
                        
                        ForEach(model.recipes) {r in
                            
                            NavigationLink(destination: RecipeDetail(recipe: r),
                                           label: {
                                
                                HStack(spacing: 20) {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .cornerRadius(5)
                                        .padding(.vertical, 10)
                                        .clipped()
                                    Text(r.name)
                                        .foregroundColor(.black)
                                } //:HSTACK
                            } //:label
                            ) //:navLink
                        } //:ForEach
                        
                    }
                    
                }
                
                
                
            }
            .navigationBarHidden(true)
            .padding()
            
            
            
            
        }//:NAV VIEW
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeModel())
    }
}
