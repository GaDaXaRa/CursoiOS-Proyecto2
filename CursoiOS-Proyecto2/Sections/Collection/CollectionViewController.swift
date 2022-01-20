//
//  CollectionViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Jorge Fuentes Casillas on 19/01/22.
//

import UIKit

class CollectionViewController: UIViewController {
	static func createFromStroyboard() -> CollectionViewController {
		return UIStoryboard(name: "CollectionViewController", bundle: .main).instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
	}
	

	// MARK: - ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
