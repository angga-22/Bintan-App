//
//  UserPreferencesViewController.swift
//  Bintan-App
//
//  Created by angga saputra on 26/06/21.
//

import UIKit

class UserPreferencesViewController: UIViewController {

    
    @IBOutlet weak var userTravellerType: UITextField!
    @IBOutlet weak var userDuration: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userStartingPoint: UITextField!
    @IBOutlet weak var startTime: UIDatePicker!
    @IBOutlet weak var endTime: UIDatePicker!
    @IBOutlet weak var viewName: UIView!
    @IBOutlet weak var viewEnd: UIView!
    
    
    let travellerTypes = ["Explorer", "Leisure"]
    
    let durations = ["One Day", "Two Days", "Three Days"]
    
    
    let pickerView1 = UIPickerView()
    let pickerView2 = UIPickerView()
    let textField1 = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView1.delegate = self
        pickerView1.dataSource = self
        pickerView2.delegate = self
        pickerView2.dataSource = self
        userTravellerType.inputView = pickerView1
        userDuration.inputView = pickerView2
        userName.delegate = self
        viewName.layer.shadowColor = UIColor.black.cgColor
        viewName.layer.shadowOpacity = 1
        viewName.layer.shadowOffset = .zero
        viewName.layer.shadowRadius = 1
        userStartingPoint.delegate = self
        

    }
    
//    @IBAction func goToStartingPointTapped(_ sender: Any) {
//        performSegue(withIdentifier: "goToStartingPoint", sender: nil)
//    }
    
    
  
    
    // MAIN FEATURE !!!!!
    
    @IBAction func generateItineraryTapped(_ sender: Any) {
        print(startTime.date)
        print(endTime.date)
        print(userName.text!)
        print(userTravellerType.text!)
        print(userDuration.text!)
        userName.text = "\(userName.text!)"
        performSegue(withIdentifier: "generateItinerary", sender: self)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        userName.resignFirstResponder()
        userStartingPoint.resignFirstResponder()
        userDuration.resignFirstResponder()
        userTravellerType.resignFirstResponder()
    }
    
    
    
}

extension UserPreferencesViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == userStartingPoint {
            performSegue(withIdentifier: "goToStartingPoint", sender: self)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userName.resignFirstResponder()
        userStartingPoint.resignFirstResponder()
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerView1 {
            return travellerTypes.count
        } else if pickerView == pickerView2 {
            return durations.count
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        if pickerView == pickerView1 {
            return travellerTypes[row]
        } else if pickerView == pickerView2 {
            return durations[row]
        } else {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerView1 {
            userTravellerType.text = travellerTypes[row]
            userTravellerType.resignFirstResponder()
        } else if pickerView == pickerView2 {
            userDuration.text = durations[row]
            userDuration.resignFirstResponder()
        }
    }
    
}

