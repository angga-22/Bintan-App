//
//  SelectedAttractionViewController.swift
//  Bintan-App
//
//  Created by angga saputra on 26/06/21.
//

import UIKit

class SelectedAttractionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var routeButton: UIButton!
    
    var dataSelectedAttraction: AttractionDetails?
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.reloadData()
        collectionView.reloadData()
    }

    
    @IBAction func routeButtonTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "goToMapRoute", sender: self)
    }
    
    

}


extension SelectedAttractionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate{
    
    static var selectedTableCellIdentifier = "SelectedAttractionTableViewCell"
    static var selectedCoolCellIdentifier = "SelectedAttractionCollectionViewCell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.selectedCoolCellIdentifier, for: indexPath) as? SelectedAttractionCollectionViewCell else { return UICollectionViewCell()}
        cell.selectedImage.image = UIImage(named: dataSelectedAttraction?.image ?? "")
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.selectedTableCellIdentifier, for: indexPath) as? SelectedAttractionTableViewCell else {
            return UITableViewCell()
        }
        cell.nameSelectedAttraction.text = dataSelectedAttraction?.name
        cell.addressSelectedAttraction.text = dataSelectedAttraction?.location
        cell.descriptionSelectedAttraction.text = dataSelectedAttraction?.description
        cell.hoursSelectedAttraction.text = dataSelectedAttraction?.availableHours
        cell.latlongAgainAgain = dataSelectedAttraction?.latlong ?? []
        return cell
    }
}
