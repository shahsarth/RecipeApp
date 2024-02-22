//
//  HomeView.swift
//  Recipes
//
//  Created by Sarth on 2/22/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var mealModel: MealViewModel
    
    func getDesserts() {
        mealModel.fetchDesserts()
    }
    
    var body: some View {
        // ScrollView of Desserts in alphabetical order
        ScrollView(.vertical){
//            LazyVStack {
                ForEach(mealModel.desserts, id: \.id){ dessert in
                    MealCardView(name: dessert.name, img: dessert.thumbnail)
                }
//            }
        }
        .onAppear{
            getDesserts()
        }
    }
}

#Preview {
    HomeView(mealModel: MealViewModel())
}
