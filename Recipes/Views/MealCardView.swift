//
//  MealCardView.swift
//  Recipes
//
//  Created by Sarth on 2/22/24.
//

import SwiftUI

struct MealCardView: View {
    var name: String
    var img: String
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    AsyncImage(url: URL(string: img)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: screenWidth, height: 150)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))

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
                            ]), startPoint: UnitPoint(x: 0.5, y: 0.05), endPoint: UnitPoint(x: 0.5, y: 0.4))
                        )
                        .edgesIgnoringSafeArea(.top)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                VStack (alignment: .leading, spacing: 0) {
                    
                    HStack{
                        Text(name)
                            .foregroundColor(.secondary)
                            .font(.system(size: 12))
                            .kerning(3)
                            .padding(.bottom, 4)
                        
                        Spacer()
                    }
                    
                    
                }
            }
            
        }
        .frame(width: screenWidth, height: 150)
    }
}

#Preview {
    MealCardView(name: "Apam Balik", img: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
}
