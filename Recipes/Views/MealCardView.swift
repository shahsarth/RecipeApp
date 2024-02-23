//
//  MealCardView.swift
//  Recipes
//
//  Created by Sarth on 2/22/24.
//

import SwiftUI

struct MealCardView: View {
    var dessert : Dessert
    var mealModel : MealViewModel
    
    var body: some View {
        VStack {
            ImageOverlayView(id: dessert.id, img: dessert.thumbnail, name: dessert.name, clickable: true)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(height: 150)
    }
}

#Preview {
    MealCardView(dessert: Dessert(id: "53049", name: "Apam Balik", thumbnail: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"), mealModel: MealViewModel())
}
