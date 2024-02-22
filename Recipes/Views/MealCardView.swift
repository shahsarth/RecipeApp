//
//  MealCardView.swift
//  Recipes
//
//  Created by Sarth on 2/22/24.
//

import SwiftUI

struct MealCardView: View {
    var name: String
    var body: some View {
        Text(name)
    }
}

#Preview {
    MealCardView(name: "Molten Lava Cake")
}
