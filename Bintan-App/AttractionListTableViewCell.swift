//
//  AttractionDetailTableViewCell.swift
//  Bintan-App
//
//  Created by angga saputra on 23/06/21.
//

import UIKit

class AttractionListTableViewCell: UITableViewCell {

    @IBOutlet weak var imageAttractionDetail: UIImageView!
    @IBOutlet weak var labelAttractionDetail: UILabel!
    @IBOutlet weak var addressAttractionDetail: UILabel!
    @IBOutlet weak var openHoursAttractionDetail: UILabel!
    @IBOutlet weak var descriptionAttractionDetail: UILabel!
    
    @IBOutlet weak var uiView: UIView!
    var latlongAgain = [Double]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        uiView.layer.shadowColor = UIColor.black.cgColor
       uiView.layer.shadowOpacity = 2
//       uiView.layer.shadowOffset = .zero
        uiView.layer.shadowRadius = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
