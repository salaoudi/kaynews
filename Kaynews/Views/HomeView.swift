//
//  HomeView.swift
//  Kaynews
//
//  Created by Zayn on 4/8/22.
//

import SwiftUI

struct HomeView: View {
	
	@StateObject var vm  = HomeViewModal()
	@State var bookmarkSheet = false

	
	
    var body: some View {
		if vm.get.isEmpty {
			ProgressView()
		} else {
			ZStack {
				
				ZStack {
					ScrollView(.horizontal) {
		
						HStack {
							
							Button(action: {
								vm.getTopHeadlines()
								
							}){
								Text("Top Headlines")
									.font(.system(size: 18))
									
							}
							.padding(.horizontal, 10)
							.padding(.vertical, 7)
							.background(Color(.systemGray6))
							.cornerRadius(10)
							.shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
							.padding(.horizontal, 5)
							
							
						Button(action: {
							vm.getEvents()
						}){
							Text("Latest Posts")
								.font(.system(size: 18))
						}
						.padding(.horizontal, 10)
						.padding(.vertical, 7)
						.background(Color(.systemGray6))
						.cornerRadius(10)
						.shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
						.padding(.horizontal, 5)
							
						
						
					}
						.background(Color.clear)
						.padding()
						.foregroundColor(Color.primary)
						.padding(.horizontal)
						
					
				}
					.padding(.leading, -20)
					.background(Color.clear)
					
					HStack {
						Spacer()
						HStack {
							
							Button(action: {
								bookmarkSheet.toggle()
							}){
								Image(systemName: "bookmark")
									.foregroundColor(Color.white)
							}
						}
						.padding(.horizontal, 10)
						.padding(.vertical, 10)
						.background(Color.pink)
						.cornerRadius(9)
						.shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
						.zIndex(200)
						.padding(.trailing)
						
						
					}
					
					
				}
				.zIndex(100)
				.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
					
				
				
				ScrollView(.vertical) {
					ForEach(vm.get) { art in
						ArticleViewCell(news: art)
							.sheet(isPresented: $bookmarkSheet) {
								BookmarksView(news: art)
							}
					}
					.padding(.top, 80)
					
				}
				
				
			}
		}
		
		
    }
}
