//
//  AttractionBannerSlideCollectionViewCell.swift
//  Bintan-App
//
//  Created by angga saputra on 22/06/21.
//

import UIKit

class AttractionBannerSlideCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bannerSlide: UIImageView!
    @IBOutlet weak var bannerName: UILabel!
    
    
    var dataAttractionSlide = AttractionBannerSlide.dataAttractionBanner
    
    var currentPageSlide = 0 {
        didSet{
            
            currentPageSlide = dataAttractionSlide.count - 1
        }
    }
    
    func configure(name: String, image: UIImage){
        bannerName.text = name
        bannerSlide.image = image
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPageSlide = Int(scrollView.contentOffset.x / width)
    }
}
