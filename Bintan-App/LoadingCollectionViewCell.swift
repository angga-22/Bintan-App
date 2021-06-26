//
//  LoadingCollectionViewCell.swift
//  Bintan-App
//
//  Created by angga saputra on 22/06/21.
//

import UIKit

class LoadingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var loadingDescription: UILabel!
    
    func configure(title: String, description: String, image: UIImage){
        loadingLabel.text = title
        loadingDescription.text = description
        loadingImage.image = image
    }
}
