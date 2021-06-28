//
//  TravellerTypeTableViewCell.swift
//  Bintan-App
//
//  Created by angga saputra on 26/06/21.
//

import UIKit

class TravellerTypeTableViewCell: UITableViewCell{
   
    @IBOutlet weak var travellerType: UIPickerView!
    var dataTraveller = [String]()
    override func awakeFromNib() {
        super.awakeFromNib()
        dataTraveller = ["satu"]
        travellerType.dataSource = self
        travellerType.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

extension TravellerTypeTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return dataTraveller.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataTraveller.count
    }
    
    
}
 

