//
//  BookmarksView.swift
//  Kaynews
//
//  Created by Zayn on 4/9/22.
//

import SwiftUI
import Kingfisher

struct BookmarksView: View {
	@EnvironmentObject var manager: StorageManager
	@State var showDetails: Bool = false
	var news: News
	
    var body: some View {
		VStack {
			HStack {
				Text("Bookmarks")
					.font(.system(size: 40))
					.bold()
				Spacer()
			}
			.padding()
			
			ScrollView(.vertical) {
				ForEach(manager.BookmarkedMovies) { bookmarks in
					VStack {
						Button(action: {
							self.showDetails.toggle()
						}){
							VStack() {
								
								KFAnimatedImage(URL(string: news.imageUrl))
									.scaledToFill()
									.frame(maxWidth: .infinity, maxHeight: 400)
								HStack {
									Text(news.newsSite)
										.foregroundColor(.primary)
										.padding(.vertical, 3)
										.padding(.horizontal, 8)
										.background(Color(.systemGray4))
										.cornerRadius(15)
									Spacer()
									HStack {
										Button(action: {
											manager.BookmarkedMovies.removeAll(where: {$0 == bookmarks})
										}){
											Image(systemName: "trash")
										}
									}
									.font(.system(size: 16, weight: .bold, design: .rounded))
									.padding(.horizontal, 10)
									.padding(.vertical, 10)
									.foregroundColor(Color.white)
									.background(Color.primary)
									.cornerRadius(10)
									
									
								}
								.padding(.horizontal)
								HStack() {
									Text(news.title)
										.multilineTextAlignment(.leading)
										.font(.system(size: 18, weight: .bold, design: .rounded))
										.foregroundColor(Color.secondary)
										
									Spacer()
								}
								.padding()
								
									
								
							}
						}
					}
					.background(Color.white)
					.cornerRadius(15)
					.shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
					.padding()
					.sheet(isPresented: $showDetails) {
						DetailsView(news: news)
					}
				}

			}
					}
    }
}
