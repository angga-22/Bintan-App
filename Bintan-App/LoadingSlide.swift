//
//  LoadingSlide.swift
//  Bintan-App
//
//  Created by angga saputra on 22/06/21.
//

import UIKit

struct LoadingSlide {
    let title, description: String
    let image: UIImage
}

extension LoadingSlide {
    static var dataLoading = [
        LoadingSlide(title: "Trikora Beach", description: "The most popular beach in Bintan is Trikora Beach and there are 6 Trikora Beach that you can enjoy", image: UIImage(named: "loading1")!),
        LoadingSlide(title: "Otak-otak", description: "Grilled fish cake (otak-otak) is a well known dish in Bintan that made of fish and spices. Psst.. You will need it more than just one piece", image: UIImage(named: "loading2")!),
        LoadingSlide(title: "Vihara Ksitigarbha Bodhisatvva", description: "One of cultural tourism choice in Bintan is Vihara Ksitigarbha Bodhisatvva that also known as the 500 Lohan Temple. You will find surreal settings of towering stone statues with unique gesture and facial expressions.", image: UIImage(named: "loading3")!),
        LoadingSlide(title: "Trikora Beach", description: "The most popular beach in Bintan is Trikora Beach and there are 6 Trikora Beach that you can enjoy", image: UIImage(named: "loading1")!),
        LoadingSlide(title: "Otak-otak", description: "Grilled fish cake (otak-otak) is a well known dish in Bintan that made of fish and spices. Psst.. You will need it more than just one piece", image: UIImage(named: "loading2")!),
        LoadingSlide(title: "Vihara Ksitigarbha Bodhisatvva", description: "One of cultural tourism choice in Bintan is Vihara Ksitigarbha Bodhisatvva that also known as the 500 Lohan Temple. You will find surreal settings of towering stone statues with unique gesture and facial expressions.", image: UIImage(named: "loading3")!)
    ]
}
