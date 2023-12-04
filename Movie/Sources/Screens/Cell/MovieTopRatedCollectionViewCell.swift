//
//  MovieTopRatedCollectionViewCell.swift
//  Movie
//
//  Created by Ezgı Mac on 2.11.2023.
//

import UIKit
import Kingfisher

class MovieTopRatedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var viewContainer: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var topMovieLabel: UILabel!
    
    
    private var urlString: String = ""
    
   
    func loadCellData(model: TopModel) {
        updateUI(title: model.title, poster: model.posterPath)
        
    }
    
    private func updateUI(title: String?, poster: String?) {
        topMovieLabel.text = title
        topMovieLabel.textColor = .white
        topMovieLabel.numberOfLines = 0
        imageView.contentMode = .scaleAspectFill
        viewContainer.backgroundColor = .black
        
        guard let posterString = poster else { return }
        urlString = "https://image.tmdb.org/t/p/w500" + posterString
        
        guard let posterImageURL = URL(string: urlString) else {
            self.imageView.image = UIImage(named: "noImageAvailable")
            return
        }
        self.imageView.image = nil
        
        getImageDataFrom(url: posterImageURL)
    }
    private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle Error
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.imageView.image = image
                }
            }
        }.resume()
    }
}
