//
//  NameTableViewCell.swift
//  Bintan-App
//
//  Created by angga saputra on 26/06/21.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itineraryName: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
