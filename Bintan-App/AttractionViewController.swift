//
//  AttractionViewController.swift
//  Bintan-App
//
//  Created by angga saputra on 22/06/21.
//

import UIKit


class AttractionViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!

    
    var dataAttractionSlide = AttractionBannerSlide.dataAttractionBanner
    
    var dataAttraction: AttractionModel?
    
    private var autoScrollTimer: Timer?
    private var currentCellIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJson()
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.dataSource = self
        collectionView.delegate = self
        autoScrollTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
    }
    
    @objc func slideToNext(){
        if currentCellIndex < dataAttractionSlide.count - 1 {
            currentCellIndex += 1
        }
        else {
            currentCellIndex = 0
        }
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
    }
    
    func loadJson(){
        if let path = Bundle.main.path(forResource: "attractiondata", ofType: "json"){
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let jsonData = try JSONSerialization.data(withJSONObject: jsonResult, options: .prettyPrinted)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                dataAttraction = try jsonDecoder.decode(AttractionModel.self, from: jsonData)
                print(dataAttraction)
            } catch {
                
            }
        }
    }
    
    func moveOnAttractionList(index: Int){
        guard let vc = storyboard?.instantiateViewController(identifier: "AttractionListViewController") as? AttractionListViewController else {
            return
        }
        vc.attractionList = dataAttraction?.response?[index]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveOnSelectedAttraction(tIndex: Int, cIndex: Int){
        guard let vc = storyboard?.instantiateViewController(identifier: "SelectedAttractionViewController") as?
                SelectedAttractionViewController else {
            return
        }
        vc.dataSelectedAttraction = dataAttraction?.response?[tIndex].attractionDetails?[cIndex]
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension AttractionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource{
    
    static var identifierBanner = "AttractionBannerSlideCollectionViewCell"
    static var identifierTableCell = "AttractionTableViewCell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataAttractionSlide.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.identifierBanner, for: indexPath) as? AttractionBannerSlideCollectionViewCell else { return UICollectionViewCell() }
        let banner = dataAttractionSlide[indexPath.row]
        cell.configure(name: banner.name, image: banner.image)
        cell.currentPageSlide = dataAttractionSlide.count - 1
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataAttraction?.response?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.identifierTableCell, for: indexPath) as? AttractionTableViewCell else {
            return UITableViewCell()
        }
        
        cell.attraction = dataAttraction?.response?[indexPath.row]
        cell.index = indexPath.row
        cell.seeAllAttractionClicked = { index in
            if let indexp = index {
                self.moveOnAttractionList(index: indexp)
            }
        }
        cell.selectedAttractionClosure = { tabIndex, colIndex in
            if let tabIndexp = tabIndex, let colIndexp = colIndex {
                self.moveOnSelectedAttraction(tIndex: tabIndexp, cIndex: colIndexp)
            }
            
        }

        return cell
    }
    
}
