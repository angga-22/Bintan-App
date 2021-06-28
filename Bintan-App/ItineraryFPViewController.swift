//
//  ItineraryTableControllers.swift
//  Binary-App
//
//  Created by Dhea Luciany Januar on 17/06/21.
//

import UIKit

class ItineraryFPViewController: UIViewController {
    
    @IBOutlet var itineraryTableView: UITableView!

    
    let data = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        itineraryTableView.delegate = self
        itineraryTableView.dataSource = self
        
    }
        
       
}

extension ItineraryFPViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count - 1
    }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
    cell.textLabel?.text = data [indexPath.row]
    return cell
    
   }

}
