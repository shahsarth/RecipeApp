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

    func parseDessertJSON(json: JSON) -> [Dessert] {
            let desserts = json["meals"]
            var dessertList : [Dessert] = []
            for dessert in desserts {
                print(dessert)
//                let newDessert = Dessert(id: dessert["idMeal"], name: dessert["strMeal"], thumbnail: dessert["strMealThumb"])
                
                dessertList.append(Dessert(id: UUID(uuidString: "1")!, name: "test", thumbnail: "test"))
            }
            return dessertList
        }

    func fetchDesserts(token: String, completion: @escaping ([Dessert]) -> Void) {
            let url = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
            let parameters: Parameters = [:]
            
            downloadData(url: url, parameters: parameters){ retJSON in
                if let json = retJSON {
                    let returnedData = self.parseDessertJSON(json: json)
                    completion(returnedData)
                }
            }
        }


    
}

