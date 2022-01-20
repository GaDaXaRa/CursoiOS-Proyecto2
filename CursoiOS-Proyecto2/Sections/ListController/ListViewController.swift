//
//  ListViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Jorge Fuentes Casillas on 19/01/22.
//

import UIKit

class ListViewController: UIViewController {
	var fetchLandmarks: FetchLandmarksUseCase?
	var detailBuilder: DetailControllerBuilder?
	var fetchCats: FetchCatsUseCaseProtocol?
	
	private var cats = [Cat]() {
		didSet {
			DispatchQueue.main.async {
				self.listTableView.reloadData()
			}
		}
	}
	
	@IBOutlet weak var listTableView: UITableView!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

		listTableView.dataSource = self
		listTableView.delegate = self
		
		//fetchData()
		fetchCatsData()
    }
	
	
	static func createFromStoryboard() -> ListViewController {
		return UIStoryboard(name: "ListViewController", bundle: .main).instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
	}
	
	
	private var landmarks = [Landmark]() {
		didSet {
			listTableView.reloadData()
		}
	}
	
	
	private func fetchCatsData() {
		fetchCats?.fetchCats(completion: { cats in
			self.cats = cats
		})
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
		return cats.count  //landmarks.count
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = listTableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
		let cat = cats[indexPath.row] //landmarks[indexPath.row]
		
		cell.textLabel?.text = cat.tagsText
		
		if let url = cat.imageURL, let data = try? Data(contentsOf: url) {
			cell.imageView?.image = UIImage(data: data)
		}
		
		return cell
	}
}


extension ListViewController: UITableViewDelegate {
	/*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let landmark = landmarks[indexPath.row]
		
		guard let detailVC = detailBuilder?.build(viewModel: landmark.toDetailViewModel) else { return }
		//let detailVC = DetailControllerBuilder().build(viewModel: landmark.toDetailViewModel)
		
		navigationController?.pushViewController(detailVC, animated: true)
	}*/
}


