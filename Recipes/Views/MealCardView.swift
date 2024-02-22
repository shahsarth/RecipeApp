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
    
    func fetchDessertInformation(){
        mealModel.fetchDessertInformation(mealID: dessert.id)
    }
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    AsyncImage(url: URL(string: dessert.thumbnail)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 150)
                                            

                    } placeholder: {
                        ProgressView()
                    }
                    
                }
                
                VStack{
                    Rectangle()
                        .fill(
                            LinearGradient(gradient: Gradient(stops: [
                                .init(color: Color.black.opacity(0.01), location: 0),
                                .init(color: Color.black.opacity(1), location: 1)
                            ]), startPoint: UnitPoint(x: 0.5, y: 0.5), endPoint: UnitPoint(x: 0.5, y: 1))
                        )
                        .edgesIgnoringSafeArea(.top)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                VStack (alignment: .leading, spacing: 0) {
                    Spacer()
                    HStack {
                        Text(dessert.name)
                            .font(.title)
                            .foregroundColor(.white)
                            .kerning(3)
                            .padding(.bottom, 4)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.title)
                            .foregroundColor(.white)
                            .kerning(3)
                            .padding(.bottom, 4)
                    }.padding(.horizontal)
                    
                    
                }
                .padding(.bottom, 8)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
    
            
        }
        .onTapGesture{
            fetchDessertInformation()
        }
        .frame(height: 150)
    }
}

#Preview {
    MealCardView(dessert: Dessert(id: "53049", name: "Apam Balik", thumbnail: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"), mealModel: MealViewModel())
}
