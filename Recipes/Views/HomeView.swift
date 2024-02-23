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
        print(mealModel.desserts)
    }
    
    var body: some View {
        // ScrollView of Desserts in alphabetical order
        NavigationView {
            ScrollView(.vertical){
                // If we have more images we might need to wrap in LazyVStack
                //                LazyVStack{
                ForEach(mealModel.desserts.values, id: \.id){ dessert in
                    // Is there better way to do than force unwrapping
                    NavigationLink(destination: DetailView(dessert: mealModel.desserts[dessert.id]!)) {
                        MealCardView(dessert: mealModel.desserts[dessert.id]!, mealModel: mealModel)
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    
                }
                //                }
            }
            .padding(.horizontal, 8)
            .navigationBarHidden(true)
        }
        .onAppear{
            getDesserts()
        }
    }
}

#Preview {
    HomeView(mealModel: MealViewModel())
}
