//
//  DetailTopModel.swift
//  Movie
//
//  Created by Ezgı Mac on 29.11.2023.
//

import Foundation

struct DetailTopModel {
    let selectedImage: String
    let titleLabel: String
    let overViewLabel: String
    
    init(selectedImage: String, titleLabel: String, overViewLabel: String ) {
        self.selectedImage = selectedImage
        self.titleLabel = titleLabel
        self.overViewLabel = overViewLabel
    }
}
