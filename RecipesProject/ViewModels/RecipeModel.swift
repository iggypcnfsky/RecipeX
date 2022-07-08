//
//  RecipeModel.swift
//  RecipesProject
//
//  Created by Iggy Pacanowski on 05/07/2022.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        //PARSING local json files
        self.recipes = DataService.getLocalData()
    }
    
}
