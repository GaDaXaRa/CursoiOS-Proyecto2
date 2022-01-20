//
//  CollectionControllerBuilder.swift
//  CursoiOS-Proyecto2
//
//  Created by Jorge Fuentes Casillas on 19/01/22.
//

import Foundation
import UIKit


class CollectionControllerBuilder {
	func build() -> UIViewController {
		let viewController = CollectionViewController.createFromStroyboard()
		
		return viewController
	}
}
