//
//  ListViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Jorge Fuentes Casillas on 19/01/22.
//

import UIKit

class ListViewController: UIViewController {
	var fetchLandmarks: FetchLandmarksUseCase?
	
	
	@IBOutlet weak var listTableView: UITableView!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

		listTableView.dataSource = self
		
		fetchData()
    }
	
	
	static func createFromStoryboard() -> ListViewController {
		return UIStoryboard(name: "ListViewController", bundle: .main).instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
	}
	
	
	private var landmarks = [Landmark]() {
		didSet {
			listTableView.reloadData()
		}
	}
	
	private func fetchData() {
		fetchLandmarks?.fetchLandmarks({ result in
			switch result {
			case .success(let landmarks):
				self.landmarks = landmarks
			case .failure: break
			}
		})
	}
}


extension ListViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return landmarks.count
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = listTableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
		let landmark = landmarks[indexPath.row]
		
		cell.textLabel?.text = landmark.name
		
		return cell
	}
}
