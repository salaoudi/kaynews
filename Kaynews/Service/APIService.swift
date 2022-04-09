//
//  APIService.swift
//  Kaynews
//
//  Created by Zayn on 4/8/22.
//

import Foundation

struct APIService {
	let urlString: String
	
	//MARK: T: DECODABLE IS A PLACEHOLDER TO REPRESENT OBJECTS AND USE THIS FUNCTION TO GET ANY JSON DATA INISTED OF HAVING TO CREATE OTHER FUNCTION: GENERIC IN OTHER WORDS
	
	func getData<T: Decodable>(
		
		dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
		KeyDecodingStartegy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
							completion: @escaping (Result<T, APIError>) -> Void) {
		guard let url = URL(string: urlString)
		else {
			completion(.failure(.invalidURL))
			return
		}
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard let httpRes = response as? HTTPURLResponse, httpRes.statusCode == 200 else {
				completion(.failure(.invalidResponseStatus))
				return
				
			}
			guard error == nil else {
				completion(.failure(.dataTaskError))
				return
				
			}
			guard let data = data else {
				completion(.failure(.corruptData))
				return
				
			}
			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = dateDecodingStrategy
			decoder.keyDecodingStrategy = KeyDecodingStartegy
			do {
				let decodedData = try decoder.decode(T.self, from: data)
				completion(.success(decodedData))
			}catch {
				completion(.failure(.decodingError))
			}
		}
		.resume()
		
		
	}
}

//MARK: THIS CUSTOM ERROR WILL ALLOW YOU TO CREATE CUSTOM ALERTS ERROR FOR THE USER AND DISPLAY IT IN THE VIEW.
enum APIError: Error {
	case invalidURL
	case invalidResponseStatus
	case dataTaskError
	case corruptData
	case decodingError
}
