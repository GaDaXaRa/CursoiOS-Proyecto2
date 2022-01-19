//
//  DetailViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Jorge Fuentes Casillas on 19/01/22.
//

import UIKit


struct DetailViewModel {
	let name: String
	let image: UIImage?
}


class DetailViewController: UIViewController {
	var viewModel: DetailViewModel?
	
	@IBOutlet weak var detailImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
        
		configure(with: viewModel)
    }
	
	
	static func create() -> DetailViewController {
		return DetailViewController(nibName: "DetailViewController", bundle: .main)
	}
	
	
	func configure(with viewModel: DetailViewModel?) {
		guard let viewModel = viewModel else { return }

		detailImage.image = viewModel.image
		nameLabel.text = viewModel.name
	}
}
