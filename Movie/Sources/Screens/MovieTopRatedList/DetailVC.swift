//
//  DetailVC.swift
//  Movie
//
//  Created by Ezgı Mac on 14.11.2023.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var detailTopModel: DetailTopModel = .init(selectedImage: "", titleLabel: "", overViewLabel: "")
    
    override func viewDidLoad() {
       super.viewDidLoad()
        titleLabel.text = detailTopModel.titleLabel
        titleLabel.textColor = .white
        overviewLabel.text = detailTopModel.overViewLabel
        overviewLabel.numberOfLines = 0
        overviewLabel.textColor = .white
        view.backgroundColor = .black
        
        let urlString = "https://image.tmdb.org/t/p/w500" + detailTopModel.selectedImage
        guard let posterImageURL = URL(string: urlString) else {
            self.detailImageView.image = UIImage(named: "noImageAvailable")
            return
        }
        self.detailImageView.image = nil
        
        getImageDataFrom(url: posterImageURL)
   
    }
   /* private func navigateToDetail(id: Int?) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailVC") as UIViewController
        navigationController?.pushViewController(detailViewController, animated: true)
    } */
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
                    self.detailImageView.image = image
                }
            }
        }.resume()
    }
}

 
