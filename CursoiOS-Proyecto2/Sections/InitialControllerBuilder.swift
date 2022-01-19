//
//  InitialControllerBuilder.swift
//  CursoiOS-Proyecto2
//
//  Created by Miguel Santiago on 19/1/22.
//

import Foundation
import UIKit

class InitialControllerBuilder {
    func build() -> UIViewController {
		let viewController = ListControllerBuilder().build()
        let navigationController = UINavigationController(rootViewController: viewController)
		navigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage(systemName: "list.bullet"), tag: 0)
		
		let tabBarController = UITabBarController()
		tabBarController.setViewControllers([navigationController], animated: false)
		
        return tabBarController
    }
}
