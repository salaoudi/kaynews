//
//  News.swift
//  Kaynews
//
//  Created by Zayn on 4/8/22.
//

import Foundation


struct News: Codable, Identifiable, Equatable, Hashable {
	
		var id: Int
		var title: String
		var url: String
		var imageUrl: String
		var newsSite: String
		var summary: String
		var publishedAt: String
	
}
