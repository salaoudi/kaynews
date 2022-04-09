//
//  DetailsView.swift
//  Kaynews
//
//  Created by Zayn on 4/8/22.
//

import SwiftUI
import Kingfisher

struct DetailsView: View {
	
	let news: News
	@State var showDetails: Bool = false
	
    var body: some View {
		VStack {
			VStack {
				VStack {
					KFAnimatedImage(URL(string: news.imageUrl))
						.scaledToFill()
						.frame(maxWidth: .infinity, maxHeight: 400)
						
				}
				.background(Color.white)
				.clipShape(RoundedRectangle(cornerRadius: 20))
				.shadow(color: Color.black.opacity(0.8), radius: 10, x: 0, y: 0)
				
					
				HStack {
					Text(news.newsSite)
						.foregroundColor(.primary)
						.padding(.vertical, 3)
						.padding(.horizontal, 8)
						.background(Color(.systemGray4))
						.cornerRadius(15)
					Spacer()
					
				}
				.padding(.horizontal)

				HStack {
					Text(news.title)
						.padding(9)
						.font(.system(size: 18, weight: .bold, design: .rounded))
						.foregroundColor(Color.secondary)
						.background(Color(.systemGray6))
						.cornerRadius(10)
						.shadow(color: Color.black.opacity(0.2), radius: 0, x: 0, y: 0)
						
					Spacer()
				}
				.padding(.horizontal)
					
						
				HStack {
					Text(news.summary)
					Spacer()
				}
				.padding(.horizontal)
					
				
			}
			
			
			Spacer()
			
		}
		
		
    }
}
