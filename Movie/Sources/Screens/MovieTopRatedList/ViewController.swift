//
//  ViewController.swift
//  Movie
//
//  Created by Ezgı Mac on 2.11.2023.
//

import UIKit

    
class ViewController: UIViewController {
    
 let viewModel = TopViewModel()
  
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        loadData()
    }

    private func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        collectionView.register(UINib(nibName: "MovieTopRatedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "movieTopRatedCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    private func loadData() {
        viewModel.getTopMovies {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieTopRatedCell", for: indexPath) as? MovieTopRatedCollectionViewCell {
            cell.loadCellData(model: viewModel.results[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - gridLayout.minimumInteritemSpacing
        return CGSize(width:widthPerItem, height:300)
    }
    
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Detail", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        let detailTopModel = DetailTopModel(selectedImage: viewModel.results[indexPath.row].posterPath, titleLabel: viewModel.results[indexPath.row].title, overViewLabel: viewModel.results[indexPath.row].overview)
        nextViewController.detailTopModel = detailTopModel
        navigationController?.pushViewController(nextViewController, animated: true)
        }
        
}





