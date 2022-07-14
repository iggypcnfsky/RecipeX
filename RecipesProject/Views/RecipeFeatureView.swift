//
//  RecipeFeatureView.swift
//  RecipeX
//
//  Created by Iggy Pacanowski on 11/07/2022.
//

import SwiftUI

struct RecipeFeatureView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var mealInView:Int = 0
    
    
//    init() { TO EXECUTE SOME CODE WHEN VIEW IS INITLIAZED
//        setFeaturedIndex()
//    }
    
    var body: some View {
    
        VStack(alignment: .leading, spacing: 0) {
            
            Spacer()
            
            Text("Featured View")
                .bold()
                .padding(.leading)
                .font(.largeTitle)
            
            
            GeometryReader { geo in
                TabView(selection: $mealInView) {
                    
                    ForEach (0..<model.recipes.count, id: \.self) { index in
                        
                        //show it only if it's featured
                        if model.recipes[index].featured == true {
                            
                            
                            //Recipe Card
                            
                            Button {
                                isDetailViewShowing.toggle()
                               //mealInView = index
                            } label: {
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
                            }.sheet(isPresented: $isDetailViewShowing) {
                            
                                RecipeDetail(recipe: model.recipes[index])
                            
                            }
                            .frame(width: geo.size.width - 50, height: geo.size.height-100)
                                .cornerRadius(20)
                                //.shadow(radius: 20)
                                .shadow(color: Color(.init(srgbRed: 0, green: 0, blue: 0, alpha: 0.3)), radius: 18, x: -1, y: 10)
                                //.tag(mealInView)

                            
                            
                                
                            
                        }
                    } //:ForEach Loop
                    
                } //:TabView
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }//:GeometryReader
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Preparation Time:")
                    .font(.headline)
                Text(model.recipes[mealInView].prepTime)
                
                Text("Highlights")
                    .font(.headline)
                HStack(spacing: 4) {
                    ForEach(0..<model.recipes[mealInView].highlights.count, id: \.self) {index in
                        if index == model.recipes[mealInView].highlights.count - 1 {
                            Text(model.recipes[mealInView].highlights[index] + ".")
                        } else {
                            Text(model.recipes[mealInView].highlights[index] + ",")
                        }
                            
                    }
                    
                }
                
                
            }.padding()
            
        } //:VSTACK
        .onAppear {
            setFeaturedIndex()
        }
        
    }
    
    func setFeaturedIndex() {
        
        //finding index of the first recipe
        var index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        
        mealInView = index ?? 0
        
    }
    
    
}

struct RecipeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeatureView()
            .environmentObject(RecipeModel())
    }
}
