//
//  AttractionDetailViewController.swift
//  Bintan-App
//
//  Created by angga saputra on 23/06/21.
//

import UIKit

class AttractionListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var attractionList : Attraction?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = attractionList?.attractionCategory
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
     

    }
    


}

extension AttractionListViewController: UITableViewDataSource, UITableViewDelegate {
    
    static let identifier = "AttractionListTableViewCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attractionList?.attractionDetails?.count ?? 0 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.identifier, for: indexPath) as? AttractionListTableViewCell else { return UITableViewCell() }
        cell.labelAttractionDetail.text = attractionList?.attractionDetails?[indexPath.row].name
        cell.addressAttractionDetail.text = attractionList?.attractionDetails?[indexPath.row].location
        cell.openHoursAttractionDetail.text = attractionList?.attractionDetails?[indexPath.row].availableHours
        cell.imageAttractionDetail.image = UIImage(named: attractionList?.attractionDetails?[indexPath.row].image ?? "")
        cell.descriptionAttractionDetail.text = attractionList?.attractionDetails?[indexPath.row].description
        cell.latlongAgain = attractionList?.attractionDetails?[indexPath.row].latlong ?? []
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SelectedAttractionViewController") as! SelectedAttractionViewController
        vc.dataSelectedAttraction = attractionList?.attractionDetails?[indexPath.row]
        present(vc, animated: true, completion: nil)
    }

}
