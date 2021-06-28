//
//  SearchViewController.swift
//  Test Map Routing
//
//  Created by Fauzi Achmad B D on 26/06/21.
//

import UIKit

class StartingPointViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textView: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var locations = [Location]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textView.resignFirstResponder()
        
        if let text = textView.text, !text.isEmpty {
            
            LocationManager.shared.findLocation(with: text) { [weak self] locations in
                
                DispatchQueue.main.async {
                    self?.locations = locations
                    self?.tableView.reloadData()
                }
                
                
            }
            
            
        }
        
        
        return true
        
    }
    

    
    
    

}

extension StartingPointViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = locations[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Notify the map to show the selected pin
        let coordinate = locations[indexPath.row].coordinates

        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UserPreferencesViewController" {
            let vc = segue.destination as! UserPreferencesViewController
            vc.userStartingPoint.text = "tes"
            present(vc, animated: true, completion: nil)
        }
    }
    
    
}
