//
//  DetailViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Jorge Fuentes Casillas on 19/01/22.
//

import UIKit

class DetailViewController: UIViewController {
	@IBOutlet weak var detailImage: UIImageView!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
	
	
	static func create() -> DetailViewController {
		return DetailViewController(nibName: "DetailViewController", bundle: .main)
	}
}
