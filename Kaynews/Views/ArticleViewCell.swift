//
//  ArticleViewCell.swift
//  Kaynews
//
//  Created by Zayn on 4/8/22.
//

import SwiftUI
import Kingfisher

struct ArticleViewCell: View {
	
	
	var news: News
	@State var showDetails: Bool = false
	@EnvironmentObject var manager: StorageManager
    var body: some View {
		
		VStack {
			Button(action: {
				self.showDetails.toggle()
			}){
				VStack() {
					
					KFAnimatedImage(URL(string: news.imageUrl))
						.scaledToFill()
						.frame(maxWidth: .infinity, maxHeight: 400)
						.overlay (
							VStack {
								HStack {
									HStack {
										Button(action: {
											checkAndAddBookmark()
											
										}){
											Image(systemName: manager.BookmarkedMovies.contains(news) ? "bookmark.fill" : "bookmark")
											
											
										}
										
										
									}
									.font(.system(size: 16, weight: .bold, design: .rounded))
									.padding(.horizontal, 10)
									.padding(.vertical, 10)
									.foregroundColor(Color.white)
									.background(Color.primary)
									.cornerRadius(13)
									
									Spacer()
								}
								.padding()
								Spacer()
							}
							
							
						)
					HStack {
						Text(news.newsSite)
							.foregroundColor(.white)
							.padding(.vertical, 1)
							.padding(.horizontal, 8)
							.background(Color(.systemPink))
							.cornerRadius(9)
						Spacer()
						
						
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
	func checkAndAddBookmark() {
		if !manager.BookmarkedMovies.contains(news) {
			manager.BookmarkedMovies.append(news)
			
		}
	}
}
//
//struct ArticleViewCell_Previews: PreviewProvider {
//    static var previews: some View {
//		ArticleViewCell(vm: HomeViewModal(), article: News())
//    }
//}
