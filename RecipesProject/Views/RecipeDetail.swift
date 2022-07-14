//
//  RecipeDetail.swift
//  RecipesProject
//
//  Created by Iggy Pacanowski on 06/07/2022.
//

import SwiftUI

struct RecipeDetail: View {
    
    @State var servingSize = 2
    
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                Text(recipe.name)
                    .font(.title2)
                    .padding(.top, 5)
                    .padding(.horizontal, 10)
                    
                
                Text("Pick your serving size:")
                    .font(.footnote)
                    .padding(.horizontal, 10)
                Picker("Pick your serving size", selection: $servingSize) {
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                }.pickerStyle(SegmentedPickerStyle())
                    .frame(width: 200)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                    
                Divider().padding(.horizontal, 10)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Ingredients")
                        .font(.title3)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                    
                    ForEach (recipe.ingredients) {item in
                        
                        //here we can define changes to the ingredients based on the amount of servings.
                        Text("- " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: servingSize) + " " + item.name)
                            .font(.footnote)
                        
                        
                    }
                    
                }.padding(.horizontal, 10)
                
                Divider().padding(.horizontal, 10)
                
                //MARK: DIRECTIONS
                VStack(alignment: .leading, spacing: 10){
                    ForEach(0..<recipe.directions.count, id: \.self) {r in
                        Text(String(r+1) + ". " + recipe.directions[r])
                            .font(.footnote)
                            .padding(.top, 10)
                    }
                }.padding(.horizontal, 10)
                
                
                
            } //:MAIN VSTACK

        }//.navigationBarTitle(recipe.name)
            .ignoresSafeArea()

        
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetail(recipe: model.recipes[1])
    }
}
