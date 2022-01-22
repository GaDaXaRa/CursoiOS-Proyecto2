//
//  Cat.swift
//  CursoiOS-Proyecto2
//
//  Created by Jorge Fuentes Casillas on 20/01/22.
//

/*
 https://cataas.com/api/cats
 https://cataas.com/cat/595f280a557291a9750ebf58
 {"id":"595f280a557291a9750ebf58","created_at":"2016-12-28T11:51:30.730Z","tags":["advent-calendar-2016","gif"]}
 */


import Foundation


struct Cat: Decodable {
	let id: String
	let created_at: String
	let tags: [String]
}


extension Cat {
	var tagsText: String {
		return tags.joined(separator: ", ")
	}
	
	var imageURL: URL? {
		return URL(string: "https://cataas.com/cat/\(id)")
	}
	
	var toListCellViewModle: ListTableCellViewModel {
		return ListTableCellViewModel(imageURL: imageURL, text: tagsText)
	}
	
	var toDetailViewModel: DetailViewModel {
		.init(name: tagsText, imageURL: imageURL)
	}
	
	var toCollectionCellViewModel: CatsCollectionViewCellViewModel {
		return CatsCollectionViewCellViewModel(name: tagsText, imageURL: imageURL)
	}
}
