//
//  DetailViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Jorge Fuentes Casillas on 19/01/22.
//


import Kingfisher
import UIKit


struct DetailViewModel {
	let name: String
	let imageURL: URL?
}


class DetailViewController: UIViewController {
	var viewModel: DetailViewModel?
	
	@IBOutlet weak var detailImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
        
		title = "Cutey Kitty 😻"
		configure(with: viewModel)
    }
	
	
	static func create() -> DetailViewController {
		return DetailViewController(nibName: "DetailViewController", bundle: .main)
	}
	
	
	func configure(with viewModel: DetailViewModel?) {
		guard let viewModel = viewModel else { return }

		detailImage.kf.setImage(with: viewModel.imageURL) 
		nameLabel.text = viewModel.name +
 """
 
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean dapibus, orci vel placerat sollicitudin, est purus venenatis lorem, in auctor dui augue non dolor. Vestibulum tellus neque, volutpat non vulputate in, sagittis id lectus. Pellentesque tortor massa, luctus consequat dictum vel, ultricies ac ex. Etiam neque velit, vestibulum sed orci at, accumsan faucibus elit. Quisque fringilla tempus magna, sagittis egestas est varius sit amet. Nullam dui nunc, vehicula sed scelerisque at, pretium sit amet augue. Integer posuere tempus ultrices. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec a maximus mi, ullamcorper vestibulum tortor. Vivamus ultrices, velit a pulvinar commodo, ipsum metus aliquet augue, sit amet rhoncus orci dui eget enim. Nullam porta convallis nisi egestas lobortis. Nulla imperdiet orci id augue suscipit pharetra ut tincidunt nunc. Mauris congue congue metus nec laoreet. Phasellus sit amet ante neque. Suspendisse potenti.
Quisque scelerisque urna quis mauris sollicitudin aliquam. Nam mollis diam arcu, ac tempor massa ullamcorper at. Mauris et luctus enim, id commodo lacus. Etiam pulvinar elit at consequat ullamcorper. Nullam lobortis urna commodo vulputate volutpat. Aliquam erat volutpat. Nunc erat sem, pretium sit amet velit a, cursus aliquet nulla. Phasellus cursus mauris in odio commodo aliquam. Curabitur ex elit, gravida quis tortor eget, vulputate egestas neque.
"""
	}
}
