//
//  ContentView.swift
//  Recipes
//
//  Created by Sarth on 2/22/24.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

struct ContentView: View {
    var body: some View {
        HomeView(mealModel: MealViewModel())
    }
}

#Preview {
    ContentView()
}
