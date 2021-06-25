//
//  SelectedAttractionViewController.swift
//  Bintan-App
//
//  Created by Mhd Idris Syahputra on 21/06/21.
//

import UIKit

class SelectedAttractionViewController: UIViewController {

    @IBOutlet var selectedAttractionCollectionView: UICollectionView!
    @IBOutlet var SelectedAttractionPageControl: UIPageControl!
    @IBOutlet var attractionName1: UILabel!
    @IBOutlet var attractionName2: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var desc: UILabel!
    @IBOutlet weak var stackViewAttraction: UIStackView!
    @IBOutlet weak var priceTimeUIView: UIView!
    @IBOutlet var attractionUIView: UIView!
    
    var imageSlides: [ImageAttractionSLide] = []
    var attractionTitle = String()
    var priceStamp = String()
    var timeStamp = String()
    var addressText = String()
    var descText = String()
    var currentPageSA = 0
    var minimumDatePicker = Date()
    var maximumDatePicker = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attractionName1.text = attractionTitle
        attractionName2.text = attractionTitle
        address.text = addressText
        desc.text = descText
        priceLabel.text = priceStamp
        timeLabel.text = timeStamp
        
        let shadowRect: CGRect = priceTimeUIView.bounds.insetBy(dx: 2, dy: 0)
        priceTimeUIView.layer.shadowPath = UIBezierPath(rect: shadowRect).cgPath
        
        changeAttribute(attractionUIView)
//        stackViewAttraction.layer.shadowColor = UIColor.black.cgColor
//        stackViewAttraction.layer.shadowRadius = 5
//        stackViewAttraction.layer.shadowOpacity = 0.1
//        stackViewAttraction.cornerRadius = 20
    }
    
    func changeAttribute(_ view: UIView) {
            
            
                view.layer.applySketchShadow(color: UIColor(red: 0, green: 0, blue: 0, alpha: 1), alpha: 0.2, x: 1, y: 2, blur: 12, spread: -3)
                view.backgroundColor = .white
                view.layer.cornerRadius = 30
            
            
        }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func routeButton(_ sender: Any) {
        print("Route")
    }
    
}

extension SelectedAttractionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageSlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageAttractionCollectionViewCell.identifier, for: indexPath) as! ImageAttractionCollectionViewCell
        cell.setup(imageSlides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let widthScroll = scrollView.frame.width
        currentPageSA = Int(scrollView.contentOffset.x / widthScroll)
        SelectedAttractionPageControl.currentPage = currentPageSA
    }
    
}

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


