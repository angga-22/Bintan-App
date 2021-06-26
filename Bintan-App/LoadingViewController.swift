//
//  LoadingViewController.swift
//  Bintan-App
//
//  Created by angga saputra on 22/06/21.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var progressView: UIProgressView!
    
    var loadingSlide = LoadingSlide.dataLoading
    private var autoScrollTimer: Timer?
    private var currentCellIndex: Int = 0
    private var progress = Progress(totalUnitCount: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        runLoading()
        autoScrollTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 5, animations: { () -> Void in
               self.progressView.setProgress(1, animated: true)
           })
    }
    
    @objc func slideToNext(){
        if currentCellIndex < loadingSlide.count - 1 {
            currentCellIndex += 1
        }
        else {
            currentCellIndex = 0
        }
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
        
    }
    
    
    func runLoading(){
        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { (timer) in
            guard self.progress.isFinished == false else {
                timer.invalidate()
                let vc = self.storyboard?.instantiateViewController(identifier: "DashboardNavigationController") as! UINavigationController
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                return
            }
            self.progress.completedUnitCount += 1
            let progressFloat = Float(self.progress.fractionCompleted)
            self.progressView.setProgress(progressFloat, animated: true)
        }
    }
    
}


extension LoadingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    static var identifier = "LoadingCollectionViewCell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LoadingSlide.dataLoading.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.identifier, for: indexPath) as? LoadingCollectionViewCell else { fatalError("failed dequeuing cell")}
        let loading = LoadingSlide.dataLoading[indexPath.row]
        cell.configure(title: loading.title, description: loading.description, image: loading.image)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}
