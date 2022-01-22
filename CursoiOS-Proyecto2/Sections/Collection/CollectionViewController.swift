//
//  CollectionViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Jorge Fuentes Casillas on 19/01/22.
//

import UIKit


class CollectionViewController: UIViewController {
	let numberOfColumns: CGFloat = 2
	var fetchCats: FetchCatsUseCaseProtocol?
	private var cats = [Cat]() {
		didSet {
			DispatchQueue.main.async {
				self.catsCollectionView.reloadData()
			}
		}
	}
	
	private var layout: UICollectionViewFlowLayout {
		let layout = UICollectionViewFlowLayout()
		layout.minimumInteritemSpacing = 10  // Minimal space between cells
		layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 30, right: 10)  // margins of each section
		
		// width = (screen's width / number of columns in screen) - (space between cells / 2) - (the left section inset)
		let width = (catsCollectionView.frame.width / numberOfColumns) - (layout.minimumInteritemSpacing / 2) - layout.sectionInset.left
		layout.itemSize = CGSize(width: width, height: width)
		
		return layout
	}
	
	var detailBuilder: DetailControllerBuilder?
	
	@IBOutlet weak var catsCollectionView: UICollectionView!
	
	
	static func createFromStroyboard() -> CollectionViewController {
		return UIStoryboard(name: "CollectionViewController", bundle: .main).instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
	}
	

	// MARK: - ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()		
		
		fetchCatsData()
    }
	
	
	private func fetchCatsData() {
		fetchCats?.fetchCats(completion: { cats in
			self.cats = cats
		})
	}
	
	// Writes the layout subviews programmed after didLoad
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		catsCollectionView.setCollectionViewLayout(layout, animated: false)
	}
}


extension CollectionViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return cats.count
	}
	
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = catsCollectionView.dequeueReusableCell(withReuseIdentifier: "catsCollectionViewCell", for: indexPath) as? CatsCollectionViewCell else {
			print("Error en CatsCollectionViewCell cellForItemAt")
			
			fatalError()
		}
		
		let model = cats[indexPath.row]
		cell.configure(with: model.toCollectionCellViewModel)
		
		return cell
	}
}


extension CollectionViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let cat = cats[indexPath.row]
		
		guard let detailVC = detailBuilder?.build(viewModel: cat.toDetailViewModel) else { return }
		
		navigationController?.pushViewController(detailVC, animated: true)
	}
}
