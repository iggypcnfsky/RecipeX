//
//  RecipeFeatureView.swift
//  RecipeX
//
//  Created by Iggy Pacanowski on 11/07/2022.
//

import SwiftUI

struct RecipeFeatureView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
    
        VStack(alignment: .leading, spacing: 0) {
            
            Spacer()
            
            Text("Featured View")
                .bold()
                .padding(.leading)
                .font(.largeTitle)
            
            GeometryReader { geo in
                TabView {
                    
                    ForEach (0..<model.recipes.count) { index in
                        
                        //show it only if it's featured
                        if model.recipes[index].featured == true {
                            
                            
                            //Recipe Card
                            
                            ZStack {
                                
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                ZStack {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .clipped()
                                        .aspectRatio(contentMode: .fill)
                                    Text(model.recipes[index].name)
                                        .font(.footnote)
                                        .foregroundColor(.white)
                                        .padding(10)
                                        .background(.ultraThinMaterial)
                                        .cornerRadius(20)
                                        .shadow(radius: 20)
                                        .padding(.top, 280)
                                }
                                
                            }
                                .frame(width: geo.size.width - 50, height: geo.size.height-100)
                                .cornerRadius(20)
                                //.shadow(radius: 20)
                                .shadow(color: Color(.init(srgbRed: 0, green: 0, blue: 0, alpha: 0.3)), radius: 18, x: -1, y: 10)
                            
                        }
                    } //:ForEach Loop
                    
                } //:TabView
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }//:GeometryReader
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Text")
                Text("Text")
                Text("Text")
                Text("Text")
                
            }.padding()
            
        } //:VSTACK
        
    }
}

struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
            .environmentObject(RecipeModel())
    }
}
