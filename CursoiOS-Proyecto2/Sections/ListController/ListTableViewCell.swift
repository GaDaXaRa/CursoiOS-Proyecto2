//
//  ListTableViewCell.swift
//  CursoiOS-Proyecto2
//
//  Created by Jorge Fuentes Casillas on 20/01/22.
//


import Kingfisher
import UIKit


struct ListTableCellViewModel {
	let imageURL: URL?
	let text: String
}


protocol ListTableViewCellDelegate: AnyObject {
	func didPressInFavorite(cell: ListTableViewCell)
}


class ListTableViewCell: UITableViewCell {
	var isFavorite: Bool = false {
		didSet {
			if isFavorite {
				favButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
			} else {
				favButton.setImage(UIImage(systemName: "star"), for: .normal)
			}
		}
	}
	
	weak var delegate: ListTableViewCellDelegate?
	
	@IBOutlet weak var cellImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var favButton: UIButton!
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	
	func configure(viewModel: ListTableCellViewModel) {
		nameLabel.text = viewModel.text
		cellImageView.kf.indicatorType = .activity
		cellImageView.kf.setImage(with: viewModel.imageURL)
	}

	
	@IBAction func favPressed(_ sender: Any) {
		delegate?.didPressInFavorite(cell: self)
	}
}
