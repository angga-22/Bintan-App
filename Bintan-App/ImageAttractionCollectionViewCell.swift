//
//  ImageAttractionCollectionViewCell.swift
//  Bintan-App
//
//  Created by Mhd Idris Syahputra on 21/06/21.
//

import UIKit

class ImageAttractionCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: ImageAttractionCollectionViewCell.self)
    
    @IBOutlet var imageSlides: UIImageView!
    
    func setup(_ slide: ImageAttractionSLide){
        imageSlides.image = slide.image
    }
}
