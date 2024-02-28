//
//  ImageOverlayView.swift
//  Recipes
//
//  Created by Sarth on 2/22/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageOverlayView: View {
    var id: String
    var image: String
    var name: String
    var clickable: Bool
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    WebImage(url: URL(string: image),
                             context: [.imageThumbnailPixelSize: CGSize(width: 500, height: 500)])
                        .resizable()
                        .placeholder {
                            ProgressView()
                        }
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 150)
                }
                
                VStack {
                    Rectangle()
                        .fill(
                            LinearGradient(gradient: Gradient(stops: [
                                .init(color: Color.black.opacity(0.01), location: 0),
                                .init(color: Color.black.opacity(0.6), location: 1)
                            ]), startPoint: UnitPoint(x: 0.5, y: 0.5), endPoint: UnitPoint(x: 0.5, y: 1))
                        )
                        .edgesIgnoringSafeArea(.top)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                    HStack {
                        Text(name)
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .kerning(3)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                        if clickable {
                            Image(systemName: "chevron.right")
                                .font(.title)
                                .foregroundColor(.white)
                                .kerning(3)
                        }
                    }.padding(.horizontal)
                }
                .padding(.bottom, 8)
            }
        }
    }
}

#Preview {
    ImageOverlayView(id: "53049", image: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", name: "Apam Balik", clickable: false)
}
