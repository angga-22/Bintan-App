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
        LoadingSlide(title: "Bintan Trip Tips and Tricks!", description: "This app will help you to guide your extraordinary journey at bintan island!", image: UIImage(named: "logo_nature")!),
       LoadingSlide(title: "Make the Itinerary", description: "This app will help you to guide your extraordinary journey at bintan island!", image: UIImage(named: "logo_nature")!),
        LoadingSlide(title: "Let’s Travel", description: "This app will help you to guide your extraordinary journey at bintan island!", image: UIImage(named: "logo_nature")!),
        LoadingSlide(title: "Bintan Trip Tips and Tricks!", description: "This app will help you to guide your extraordinary journey at bintan island!", image: UIImage(named: "logo_nature")!),
       LoadingSlide(title: "Make the Itinerary", description: "This app will help you to guide your extraordinary journey at bintan island!", image: UIImage(named: "logo_nature")!),
        LoadingSlide(title: "Let’s Travel", description: "This app will help you to guide your extraordinary journey at bintan island!", image: UIImage(named: "logo_nature")!)
    ]
}
