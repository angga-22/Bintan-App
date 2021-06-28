//
//  ForecastWeatherListVC.swift
//  Binary-App
//
//  Created by Fauzi Achmad B D on 20/06/21.
//

import UIKit

class ForecastWeatherListVC: UIViewController {
    
    let data = [
    
        "25.8º","27º","26º","26.2º","28.4º", "29º", "28.3º"
    ]

    @IBOutlet weak var forecastWeatherTabelView: UITableView!
    @IBOutlet weak var heloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Floating loaded")

        forecastWeatherTabelView.delegate = self
        forecastWeatherTabelView.dataSource = self

        
    }

}


extension ForecastWeatherListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]

        cell.contentView.largeContentImage = UIImage(systemName: "cloud.fill")
       return cell
        
    }
}
