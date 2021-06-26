//
//  ViewController.swift
//  Bintan-App
//
//  Created by angga saputra on 21/06/21.
//

import UIKit
class OnBoardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    var onBoardingSlide = OnBoardingSlide.dataSlide
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == onBoardingSlide.count - 1{
                nextButton.setTitle("Let's Get Lost", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if currentPage == onBoardingSlide.count - 1{
            let vc = storyboard?.instantiateViewController(withIdentifier: "LoadingViewController") as! LoadingViewController
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
           present(vc, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}

extension OnBoardingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    static let onBoardingIdentifier = "OnBoardingCollectionViewCell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onBoardingSlide.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.onBoardingIdentifier, for: indexPath) as? OnBoardingCollectionViewCell else { fatalError("cannot get cell")}
        let slides = onBoardingSlide[indexPath.row]
        cell.configure(title: slides.title, description: slides.description, image: slides.image)
        collectionView.reloadItems(at: [indexPath])
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}



    
