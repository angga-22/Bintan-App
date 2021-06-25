//
//  BeforeSelectedAttractionViewController.swift
//  Bintan-App
//
//  Created by Mhd Idris Syahputra on 21/06/21.
//

import UIKit

class BeforeSelectedAttractionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let destinationController = segue.destination as! SelectedAttractionViewController
        
        if segue.identifier == "gurunPasirSegue" {
            destinationController.attractionTitle = "Gurun Pasir"
            destinationController.addressText = "Jl. Raya Busung, Busung"
            destinationController.priceStamp = "Rp. 300.000"
            destinationController.timeStamp = "09.00 - 10.00"
            destinationController.descText = "Gurun Pasir adalah salah satu destinasi wisata di pulau bintan yang menawarkan keindahan hamparan pasir putih yang sangat luas"
            destinationController.imageSlides = [ImageAttractionSLide(image: UIImage(named: "Trikora1")!),ImageAttractionSLide(image: UIImage(named: "Trikora2")!),ImageAttractionSLide(image: UIImage(named: "Trikora3")!)]
        }
        
        if segue.identifier == "pantaiTrikoraSegue" {
            destinationController.attractionTitle = "Pantai Trikora"
            destinationController.addressText = "Trikora, Kawal, Gn. Kijang"
            destinationController.priceStamp = "Rp. 600.000"
            destinationController.timeStamp = "09.00 - 10.00"
            destinationController.descText = "Pantai Trikora adalah salah satu pantai dengan pasir putih yang terletak di pulau Bintan, Kepulauan Riau, Indonesia. Pantai alami ini memiliki ombak yang landai dengan bebatuan-bebatuan indah di pantai. Sepanjang perjalanan menuju pantai Trikora, terdapat perkampungan nelayan yang berjejer rapi, beberapa resor-resor mewah, kawasan konservasi padang lamun, rumah makan seafood, hingga hutan mangrove. Pantai ini memiliki empat bagian, yakni Trikora 1, 2, 3 (Trikot), dan 4."
            destinationController.imageSlides = [ImageAttractionSLide(image: UIImage(named: "Trikora3")!),ImageAttractionSLide(image: UIImage(named: "Trikora2")!),ImageAttractionSLide(image: UIImage(named: "Trikora1")!)]
        }
    }

}
