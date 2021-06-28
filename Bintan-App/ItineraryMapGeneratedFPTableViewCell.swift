//
//  StartingPointTableViewCell.swift
//  Bintan-App
//
//  Created by angga saputra on 26/06/21.
//

import UIKit

class ItineraryMapGeneratedFPTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var attractionNameInMainFeature: UILabel!
    @IBOutlet weak var attractionCategoryInMainFeature: UILabel!
    @IBOutlet weak var attractionImageInMainFeature: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
