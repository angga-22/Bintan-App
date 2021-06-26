//
//  ItineraryTableControllers.swift
//  Binary-App
//
//  Created by Dhea Luciany Januar on 17/06/21.
//

import UIKit

class ItineraryTableControllers: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var itineraryTableView: UITableView!
    
    @IBOutlet weak var headerLabel: UILabel!
    
    let data = [
        "Pantai Pangudang",
        "Pantai Trikora 1",
        "Pantai Trikora 2",
        "Pantai Trikora 3"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        itineraryTableView.delegate = self
        itineraryTableView.dataSource = self
        
    }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count - 1
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = data [indexPath.row]
        return cell
        
    }
    

    

}
