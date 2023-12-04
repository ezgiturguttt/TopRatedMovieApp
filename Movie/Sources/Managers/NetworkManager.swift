//
//  NetworkManager.swift
//  Movie
//
//  Created by Ezgı Mac on 2.11.2023.
//

import Foundation

class NetworkManager {
    class func fetchTopRatedData(urlString: String, completion:@escaping ([TopModel]?, String?) -> Void) {
        guard let url = URL(string: urlString) else { return }
       let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data {
                let topRatedDataModel = try? JSONDecoder().decode(TopRatedResults.self, from: data)
                completion(topRatedDataModel?.results, nil)
            } else {
                completion(nil, "Error")
            }
        }
        task.resume()
    }
}
