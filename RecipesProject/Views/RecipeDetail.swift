//
//  RecipeDetail.swift
//  RecipesProject
//
//  Created by Iggy Pacanowski on 06/07/2022.
//

import SwiftUI

struct RecipeDetail: View {
    
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.title2)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                    
                    ForEach (recipe.ingredients) {item in
                        Text(item.name)
                    }
                    
                }.padding(.horizontal, 10)
                
                Divider()
                
                //MARK: DIRECTIONS
                VStack(alignment: .leading, spacing: 10){
                    ForEach(0..<recipe.directions.count, id: \.self) {r in
                        Text(String(r+1) + ". " + recipe.directions[r])
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                    }
                }.padding(.horizontal, 10)
                
                
                
            } //:MAIN VSTACK

        }.navigationBarTitle(recipe.name)

        
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetail(recipe: model.recipes[0])
    }
}
