//
//  InputNameViewController.swift
//  Bintan-App
//
//  Created by angga saputra on 27/06/21.
//

import UIKit

class InputNameViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
