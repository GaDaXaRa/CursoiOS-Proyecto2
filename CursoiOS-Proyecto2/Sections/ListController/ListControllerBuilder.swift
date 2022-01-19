//
//  ListControllerBuilder.swift
//  CursoiOS-Proyecto2
//
//  Created by Jorge Fuentes Casillas on 19/01/22.
//

import Foundation
import UIKit


class ListControllerBuilder {
	func build() -> UIViewController {
		let viewController = ListViewController.createFromStoryboard()
		viewController.fetchLandmarks = FetchLandmarksFromDisk()
		
		return viewController
	}
}
