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
        NavigationView {
            ScrollView(.vertical) {
                // If we have more images we might need to wrap in LazyVStack
                //                LazyVStack{
                ForEach(mealModel.desserts.keys, id: \.self) { key in
                    // Is there better way to do than force unwrapping
                    if let dessert = mealModel.desserts[key] {
                        NavigationLink(destination: DetailView(dessert: dessert)) {
                            MealCardView(dessert: dessert, mealModel: mealModel)
                        }
                        .navigationBarTitleDisplayMode(.inline)
                    }
                }
                //                }
            }
            .padding(.horizontal, 8)
            .navigationBarHidden(true)
        }
        .onAppear {
            getDesserts()
        }
    }
}

#Preview {
    HomeView(mealModel: MealViewModel())
}
