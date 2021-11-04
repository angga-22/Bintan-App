//
//  AttractionTableViewCell.swift
//  Bintan-App
//
//  Created by angga saputra on 23/06/21.
//

import UIKit

typealias SeeAllClosure = ((_ index: Int?) -> Void)
typealias SelectedAttractionClosure = ((_ tableIndex: Int?, _ collectionView: Int? ) -> Void)

class AttractionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var index: Int?
    var seeAllAttractionClicked: SeeAllClosure?
    var selectedAttractionClosure: SelectedAttractionClosure?
    var attraction: Attraction? {
        didSet{
            categoryLabel.text = attraction?.attractionCategory
            collectionView.reloadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func seeAllButtonTapped(_ sender: Any) {
        seeAllAttractionClicked?(index)
    }
    
}

extension AttractionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    static var identifier = "AttractionCollectionViewCell"
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return attraction?.attractionDetails?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.identifier, for: indexPath) as? AttractionCollectionViewCell else {
            return UICollectionViewCell()
            
        }
        cell.labelAttraction.text = attraction?.attractionDetails?[indexPath.row].name
        cell.addressAttraction.text = attraction?.attractionDetails?[indexPath.row].location
        cell.imageAttraction.image = UIImage(named: (attraction?.attractionDetails?[indexPath.row].image ?? ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedAttractionClosure?(index, indexPath.row)
    }
}
