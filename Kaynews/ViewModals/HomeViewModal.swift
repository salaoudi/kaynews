//
//  HomeViewModal.swift
//  Kaynews
//
//  Created by Zayn on 4/8/22.
//

import SwiftUI
import Foundation


class HomeViewModal: ObservableObject {
	
	@Published var get: [News] = []
	
	
	init () {
		getTopHeadlines()
	}
	func getTopHeadlines() {
		let apiService = APIService(urlString: "https://api.spaceflightnewsapi.net/v3/articles")
		apiService.getData {(result: Result<[News], APIError>) in
			switch result {
			case .success(let news):
				DispatchQueue.main.async {
					self.get = news
				}
				
			case .failure(let error):
				print(error)
			}
		}
	}
	
	func getEvents() {
		let apiService = APIService(urlString: "https://api.spaceflightnewsapi.net/v3/blogs")
		apiService.getData {(result: Result<[News], APIError>) in
			switch result {
			case .success(let news):
				DispatchQueue.main.async {
					self.get = news
				}
				
			case .failure(let error):
				print(error)
			}
		}
	}
	
	
	
	
	
}
