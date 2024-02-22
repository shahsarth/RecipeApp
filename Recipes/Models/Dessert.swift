//
//  Dessert.swift
//  Recipes
//
//  Created by Sarth on 2/22/24.
//

import Foundation

class Dessert: ObservableObject, Identifiable, Equatable, Hashable {
    var id : String
    var name: String
    var thumbnail: String
    
    init(id: String, name: String, thumbnail: String) {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
    }
    
    static func ==(lhs: Dessert, rhs: Dessert) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
