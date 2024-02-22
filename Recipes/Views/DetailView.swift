//
//  DetailView.swift
//  Recipes
//
//  Created by Sarth on 2/22/24.
//

import SwiftUI

struct DetailView: View {
    var dessert : Dessert
    var body: some View {
        VStack {
            // Image and Name at top
            
            // Ingredient View
            Text("Ingredients")
                .font(.title)
            
            // Instructions View
            Text("Instructions")
                .font(.title)
        }
       
    }
}

#Preview {
    DetailView(dessert: Dessert(id: "53049", name: "Apam Balik", thumbnail: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"))
}
