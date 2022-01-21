//
//  FetchCatsUseCase.swift
//  CursoiOS-Proyecto2
//
//  Created by Jorge Fuentes Casillas on 20/01/22.
//


/*
 https://cataas.com/api/cats
 https://cataas.com/cat/595f280a557291a9750ebf58
 {"id":"595f280a557291a9750ebf58","created_at":"2016-12-28T11:51:30.730Z","tags":["advent-calendar-2016","gif"]}
 */


import Alamofire
import Foundation


protocol FetchCatsUseCaseProtocol {
	func fetchCats(completion: @escaping ([Cat]) -> Void)
}


class FetchCatsFromAPI: FetchCatsUseCaseProtocol {
	func fetchCats(completion: @escaping ([Cat]) -> Void) {
		guard let url = URL(string: "https://cataas.com/api/cats") else {
			completion([])
			
			return
		}
		
		let request = URLRequest(url: url)
		// Use of Alamofire
		AF.request(request).responseDecodable { (response: DataResponse<[Cat], AFError>) in
			switch response.result {
			case .success(let cats):
				completion(cats)
				
			case .failure:
				completion([])
			}
		}.validate()
		
		// Use of URLSession
		/*let task = URLSession.shared.dataTask(with: request) { data, response, error in
			guard let data = data else {
				completion([])
				
				return
			}
			
			do {
				let catsDecoder = try JSONDecoder().decode([Cat].self, from: data)
				completion(catsDecoder)
			} catch let error {
				print(error)
				completion([])
			}
		}
			
		task.resume()*/
	}
}
