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
            ScrollView(.vertical) {
                // Image and Name at top
                ImageOverlayView(img: dessert.thumbnail, name: dessert.name, clickable: false)
                    .clipShape(RoundedRectangle(cornerRadius: 0))
                    .frame(height: 300)
                
                
                VStack {
                    // Ingredient View
                    HStack {
                        VStack {
                            HStack {
                                Text("Ingredients")
                                    .font(.title)
                                Spacer()
                        
                            }
                           
                            
                            if let unwrappedItems = dessert.ingredients {
                                ForEach(unwrappedItems, id: \.self){ ingredient in
                                    HStack {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(.black)
                                            .font(.system(size: 12))
                                        Text(ingredient)
                                            .font(.title3)
                                        Spacer()
                                    }
                                    
                                }
                            }
                                
                        }
                        
                        Spacer()
                    }
                    
                    // Instructions View
                    HStack {
                        VStack{
                            HStack{
                                Text("Instructions")
                                    .font(.title)
                                
                                Spacer()
                            }
                            
                            
                            Text(dessert.instructions ?? "")
                                .font(.body)
                        }
                        

                        Spacer()
                    }
                }.padding(.horizontal)
               
                
                Spacer()
                
                
            }
            
        }
        .edgesIgnoringSafeArea(.top)
        
    }
}

#Preview {
    DetailView(dessert: Dessert(id: "53049", name: "Apam Balik", thumbnail: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", instructions: "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm", ingredients: ["jam", "fruit"]))
}
