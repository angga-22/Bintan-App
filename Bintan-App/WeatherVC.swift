//
//  WeatherVC.swift
//  Binary-App
//
//  Created by Fauzi Achmad B D on 20/06/21.
//

import UIKit
import FloatingPanel
import Alamofire
import SwiftyJSON

class WeatherVC: UIViewController,FloatingPanelControllerDelegate {

    let currentDate = Date()
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var informationContainerRight: UIView!
    @IBOutlet weak var informationContainerCenter: UIView!
    @IBOutlet weak var informationContainerLeft: UIView!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var seaLevel: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Date Label Update
        dateLabel.text = currentDate.formatString
        
        // MARK: Set Up Floating Panel Controller
        let floatingPanel = FloatingPanelController()
        
        floatingPanel.delegate = self

        guard let forcastWeatherVC = storyboard?.instantiateViewController(identifier: "forecastWeatherList") as? ForecastWeatherListVC else {
            return
        }

        floatingPanel.set(contentViewController: forcastWeatherVC)
        floatingPanel.addPanel(toParent: self)

        // MARK: Changing The Information Container Attributes
        changeAttribute([informationContainerLeft,informationContainerCenter,informationContainerRight])
        
        
        // Update Weather
        
        fetchWeather("Tanjung Pinang")
        
    

        
    }
    
    func changeAttribute(_ views: [UIView]) {
        
        for view in views {
            view.layer.applySketchShadow(color: UIColor(red: 0, green: 0, blue: 0, alpha: 1), alpha: 0.2, x: 1, y: 2, blur: 12, spread: -3)
            view.backgroundColor = .white
            view.layer.cornerRadius = 20
        }
        
    }
    
    func fetchWeather(_ cityName: String) {
        
        
        let apiURL = "http://api.openweathermap.org/data/2.5/weather"
        
        let parameters : [String:String] = [
        
            "q" : "\(cityName)",
            "appid" : "11bdecdb01dea7b3ffcd1c5cc382c64a"
            
        ]
        
        AF.request(apiURL, method: .get, parameters: parameters).responseJSON { (response) in
            
            switch response.result {
            
            case .success(let value):
                
                let weatherJSON: JSON = JSON(value)
                
                self.temperature.text = String(format: "%.1f", Double(weatherJSON["main"]["temp"].stringValue)! - 273.15) + " ºC"
                
                let _: String = weatherJSON["weather"][0]["main"].stringValue
                self.seaLevel.text = weatherJSON["main"]["sea_level"].stringValue
                self.humidity.text = weatherJSON["main"]["humidity"].stringValue
                self.windSpeed.text = weatherJSON["wind"]["speed"].stringValue
                
            
            case .failure(_):
                print("Request Failed")
            }
            
        }
        
    }
    
}

// Extension for Layer Shadow
extension CALayer {
  func applySketchShadow(
    color: UIColor = .black,
    alpha: Float = 0.5,
    x: CGFloat = 0,
    y: CGFloat = 2,
    blur: CGFloat = 4,
    spread: CGFloat = 0)
  {
    masksToBounds = false
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 2.0
    if spread == 0 {
      shadowPath = nil
    } else {
      let dx = -spread
      let rect = bounds.insetBy(dx: dx, dy: dx)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
  }
}

extension Date {
    var formatString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM YYYY"
        return dateFormatter.string(from: self)
    }
}
