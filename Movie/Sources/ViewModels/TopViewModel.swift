//
//  TopViewModel.swift
//  Movie
//
//  Created by Ezgı Mac on 2.11.2023.
//

import Foundation

class TopViewModel {
    var results = [TopModel]()
    
    func getTopMovies(completion:@escaping () -> Void) {
        let urlString = "https://api.themoviedb.org/3/movie/top_rated?api_key=a0c15acf5a04d8f4fe53343ab3b18b7f"
       
        NetworkManager.fetchTopRatedData(urlString: urlString) { results, error in
            if let results {
                self.results = results
                completion()
            }
        }
    }
}


