//
//  SelectedAttractionTableViewCell.swift
//  Bintan-App
//
//  Created by angga saputra on 26/06/21.
//

import UIKit

class SelectedAttractionTableViewCell: UITableViewCell {


    @IBOutlet weak var nameSelectedAttraction: UILabel!
    @IBOutlet weak var addressSelectedAttraction: UILabel!
    @IBOutlet weak var priceSelectedAttraction: UILabel!
    @IBOutlet weak var hoursSelectedAttraction: UILabel!
    @IBOutlet weak var descriptionSelectedAttraction: UILabel!
    @IBOutlet weak var latlong: UILabel!
    @IBOutlet weak var uiView: UIView!

    var latlongAgainAgain = [Double]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization cod
        latlong.text = "\(latlongAgainAgain)"
        uiView.layer.shadowColor = UIColor.black.cgColor
        uiView.layer.shadowOpacity = 1
        uiView.layer.shadowRadius = 1
        uiView.layer.shadowOffset = .zero
        descriptionSelectedAttraction.text = .some("....")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
