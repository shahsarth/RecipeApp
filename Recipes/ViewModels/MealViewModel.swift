//
//  MealViewModel.swift
//  Recipes
//
//  Created by Sarth on 2/22/24.
//

// Handle all API request logic here
import Foundation
import Alamofire
import SwiftyJSON

class MealViewModel : ObservableObject {
    
    @Published var desserts : [Dessert]
    
    init() {
        self.desserts = []
    }
    
    func downloadData(url: String, parameters: Parameters, completion: @escaping (JSON?) -> Void){
        
        let _ = AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            switch response.result {
            case let .success(value):
                let json = JSON(value)
                completion(json)
                
            case let .failure(error):
                print("Failure: this is an error")
                print(error)
                completion(nil)
            }
        }
    }
    
    func parseDessertJSONFull(json: JSON) -> [Dessert] {
        let desserts = json["meals"]
        var dessertList : [Dessert] = []
        for dessert in desserts {
//            print(dessert)
            let dessertData = dessert.1
            // Get ingredients list
            var ingredients : [String] = []
            var currNumber = 1
            
            while dessertData["strIngredient\(String(currNumber))"].stringValue != "" {
                let measurement = dessertData["strMeasure\(String(currNumber))"].stringValue
                let ingredient = dessertData["strIngredient\(String(currNumber))"].stringValue
                ingredients.append("\(measurement) \(ingredient)")
                currNumber += 1
            }
            
            
            let newDessert = Dessert(id: dessertData["idMeal"].stringValue, name: dessertData["strMeal"].stringValue, thumbnail: dessertData["strMealThumb"].stringValue, instructions: dessertData["strInstructions"].stringValue, ingredients: ingredients)
            dessertList.append(newDessert)
        }
        return dessertList
    }
    
    
    func parseDessertJSON(json: JSON) -> [Dessert] {
        let desserts = json["meals"]
        var dessertList : [Dessert] = []
        for dessert in desserts {
//            print(dessert)
            let dessertData = dessert.1
            let newDessert = Dessert(id: dessertData["idMeal"].stringValue, name: dessertData["strMeal"].stringValue, thumbnail: dessertData["strMealThumb"].stringValue)
            dessertList.append(newDessert)
        }
        return dessertList
    }
    
//    func parseDessertJSONInformation(json: JSON) -> Dessert {
//        let dessertData = dessert.1
//        // Get ingredients list
//        var ingredients : [String] = []
//        var currNumber = 1
//        
//        while dessertData["strIngredient\(String(currNumber))"].stringValue != "" {
//            let measurement = dessertData["strMeasure\(String(currNumber))"].stringValue
//            let ingredient = dessertData["strIngredient\(String(currNumber))"].stringValue
//            ingredients.append("\(measurement) \(ingredient)")
//        }
//        
//        
//        let newDessert = Dessert(id: dessertData["idMeal"].stringValue, name: dessertData["strMeal"].stringValue, thumbnail: dessertData["strMealThumb"].stringValue, instructions: dessertData["strInstructions"].stringValue, ingredients: ingredients)
//        return newDessert
//    }
    
    func fetchDesserts() {
        let url = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        let parameters: Parameters = [:]
        
        downloadData(url: url, parameters: parameters){ retJSON in
            if let json = retJSON {
                let returnedData = self.parseDessertJSON(json: json)
                self.desserts = returnedData
                
            }
        }
    }
    
    func fetchDessertInformation() {
        for dessert in self.desserts {
            fetchDessertInformationByID(mealID: dessert.id)
            
        }
    }
    
    func fetchDessertInformationByID(mealID: String) {
        let url = "https://themealdb.com/api/json/v1/1/lookup.php?i=" + mealID
        print(url)
        let parameters: Parameters = [:]
        
        downloadData(url: url, parameters: parameters){ retJSON in
            if let json = retJSON {
                print("IM HERRRRREEE")
                let returnedData = self.parseDessertJSONFull(json: json)
                print(returnedData.description)
//                self.desserts = returnedData
                print("IMM HEREEEE 2.000000")
                
            }
        }
    }
    
    
    
}

