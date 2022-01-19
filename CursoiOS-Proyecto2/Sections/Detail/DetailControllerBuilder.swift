//
//  DetailControllerBuilder.swift
//  CursoiOS-Proyecto2
//
//  Created by Jorge Fuentes Casillas on 19/01/22.
//

import Foundation
import UIKit


class DetailControllerBuilder {
	func build() -> UIViewController {
		let viewController = DetailViewController.create()
		
		return viewController
	}
}
