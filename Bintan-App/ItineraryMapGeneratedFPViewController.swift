//
//  MapFPViewController.swift
//  Bintan-App
//
//  Created by angga saputra on 27/06/21.
//

import UIKit

struct ItineraryMapDataModel {
    var title: String
    var image: UIImage
    var category: String
    var latitude: Double
    var longitude: Double
}

class ItineraryMapGeneratedFPViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    private var  dataModel = [
        ItineraryMapDataModel(title: "Pengudang Beach", image: UIImage(named: "pantaiPengudang") ?? UIImage(), category: "Attraction", latitude: 1.1, longitude: 1.1),
        ItineraryMapDataModel(title: "Safari Lagoi Beach", image: UIImage(named: "safariLagoiBintan") ?? UIImage(), category: "Attraction", latitude: 1.1, longitude: 1.1),
        ItineraryMapDataModel(title: "Sakerah Beach", image: UIImage(named: "pantaiSakerah") ?? UIImage(), category: "Attraction", latitude: 1.1, longitude: 1.1),
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension ItineraryMapGeneratedFPViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       //temporary
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItineraryMapGeneratedFPTableViewCell", for: indexPath) as? ItineraryMapGeneratedFPTableViewCell else { return UITableViewCell()}
        
        cell.attractionNameInMainFeature.text = dataModel[indexPath.row].title
        cell.attractionCategoryInMainFeature.text = dataModel[indexPath.row].category
        cell.attractionImageInMainFeature.image = dataModel[indexPath.row].image
        return cell
    }
    
    
}
