//
//  OnBoardingCollectionViewCell.swift
//  Bintan-App
//
//  Created by angga saputra on 21/06/21.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleSlide: UILabel!
    @IBOutlet weak var imageSlide: UIImageView!
    @IBOutlet weak var descriptionSlide: UILabel!
    
    func configure(title: String, description: String, image: UIImage){
        titleSlide.text = title
        descriptionSlide.text = description
        imageSlide.image = image
    }
}
