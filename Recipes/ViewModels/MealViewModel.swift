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
import OrderedCollections

class MealViewModel: ObservableObject {
    @Published var desserts: OrderedDictionary<String, Dessert>
    
    init() {
        self.desserts = [:]
    }
    
    // MARK: PARSE JSON FUNCTIONS
    func parseDessertJSONFull(json: JSON) -> [Dessert] {
        let desserts = json["meals"]
        var dessertList: [Dessert] = []
        for dessert in desserts {
            let dessertData = dessert.1
            // Get ingredients list
            var ingredients: [String] = []
            var currNumber = 1
            while dessertData["strIngredient\(String(currNumber))"].stringValue != "" {
                let measurement = dessertData["strMeasure\(String(currNumber))"].stringValue
                let ingredient = dessertData["strIngredient\(String(currNumber))"].stringValue
                ingredients.append("\(measurement) \(ingredient)")
                currNumber += 1
            }
            let newDessert = Dessert(id: dessertData["idMeal"].stringValue,
                                     name: dessertData["strMeal"].stringValue,
                                     thumbnail: dessertData["strMealThumb"].stringValue,
                                     instructions: dessertData["strInstructions"].stringValue,
                                     ingredients: ingredients)
            dessertList.append(newDessert)
        }
        return dessertList
    }
    
    func parseDessertJSON(json: JSON) -> [Dessert] {
        let desserts = json["meals"]
        var dessertList: [Dessert] = []
        for dessert in desserts {
            let dessertData = dessert.1
            let newDessert = Dessert(id: dessertData["idMeal"].stringValue,
                                     name: dessertData["strMeal"].stringValue,
                                     thumbnail: dessertData["strMealThumb"].stringValue)
            dessertList.append(newDessert)
        }
        return dessertList
    }
    
    // MARK: GET REQUESTS
    func downloadData(url: String, parameters: Parameters, completion: @escaping (JSON?) -> Void) {
        _ = AF.request(url, method: .get, parameters: parameters).responseJSON { response in
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
    
    func fetchDesserts() {
        let url = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        let parameters: Parameters = [:]
        
        downloadData(url: url, parameters: parameters) { retJSON in
            if let json = retJSON {
                let returnedData = self.parseDessertJSON(json: json)
                for currDessert in returnedData {
                    self.desserts[currDessert.id] = currDessert
                }
                self.desserts.sort {
                    $0.value.name < $1.value.name
                }
                self.fetchDessertInformation()
            }
        }
    }
    
    func fetchDessertInformation() {
        for key in self.desserts.keys {
            fetchDessertInformationByID(mealID: key) { retDessert in
                self.desserts[key] = retDessert
            }
        }
    }
    
    func fetchDessertInformationByID(mealID: String, completion: @escaping (Dessert?) -> Void) {
        let url = "https://themealdb.com/api/json/v1/1/lookup.php?i=" + mealID
        let parameters: Parameters = [:]
        var retVal: [Dessert] = []
        downloadData(url: url, parameters: parameters) { retJSON in
            if let json = retJSON {
                retVal = self.parseDessertJSONFull(json: json)
                completion(retVal[0])
            }
        }
    }
}
