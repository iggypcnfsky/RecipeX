//
//  DataService.swift
//  RecipesProject
//
//  Created by Iggy Pacanowski on 05/07/2022.
//

import Foundation


class DataService {
    
    
    static func getLocalData() -> [Recipe] {
        
        //Parse local JSON data
        
        
        //Get a URL path to JSON file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        //Create a URL object
        let url = URL(fileURLWithPath: pathString!)
        
        //Create a data object
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for r in recipeData {
                    r.id = UUID()
                    
                }
                
                return recipeData
                
                
                
            } catch {
                print(error)
            }
            
        } catch {
            print(error)
        }
        
       return [Recipe]()
        
        
    }
    
    
}
