//
//  DashboardViewController.swift
//  Bintan-App
//
//  Created by angga saputra on 22/06/21.
//

import UIKit

class DashboardViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addItinerary(_ sender: Any) {
        performSegue(withIdentifier: "goToItinerary", sender: nil)
    }
    @IBAction func covidButton(_ sender: Any) {
        performSegue(withIdentifier: "goToCovid", sender: nil)
    }
    
    @IBAction func attractionButton(_ sender: Any) {
        
        performSegue(withIdentifier: "GoToAttaraction", sender: nil)
    }
    
    @IBAction func weatherButton(_ sender: Any) {
       performSegue(withIdentifier: "goToWeather", sender: self)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWeather" {
            _ = segue.destination as! WeatherVC
           
        }
    }
}
