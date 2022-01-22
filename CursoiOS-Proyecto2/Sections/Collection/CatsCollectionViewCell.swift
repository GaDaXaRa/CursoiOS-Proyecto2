//
//  CatsCollectionViewCell.swift
//  CursoiOS-Proyecto2
//
//  Created by Jorge Fuentes Casillas on 21/01/22.
//

import Kingfisher
import UIKit


struct CatsCollectionViewCellViewModel {
	let name: String
	let imageURL: URL?
}


class CatsCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var catImageView: UIImageView!
	@IBOutlet weak var catNameLabel: UILabel!
	
	
	func configure(with viewModel: CatsCollectionViewCellViewModel) {
		catImageView.kf.setImage(with: viewModel.imageURL)
		catNameLabel.text = viewModel.name
		
		contentView.layer.cornerRadius = 10
		contentView.layer.masksToBounds = true
		
		layer.shadowColor = UIColor.gray.cgColor
		layer.shadowOffset = CGSize(width: 0, height: 2)
		layer.shadowRadius = 2
		layer.shadowOpacity = 1
		layer.masksToBounds = false
		layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
	}
}
