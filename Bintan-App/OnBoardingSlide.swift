//
//  OnBoardingSlide.swift
//  Bintan-App
//
//  Created by angga saputra on 21/06/21.
//

import UIKit

struct OnBoardingSlide {
    let title, description: String
    let image: UIImage
}

extension OnBoardingSlide {
    static var dataSlide = [
        OnBoardingSlide(title: "Welcome to Bintan Island!", description: "This app will help you to guide your extraordinary journey at bintan island!", image: UIImage(named: "logo_nature")!),
        OnBoardingSlide(title: "Make the Itinerary", description: "This app will help you to guide your extraordinary journey at bintan island!", image: UIImage(named: "logo_nature")!),
        OnBoardingSlide(title: "Let’s Travel", description: "This app will help you to guide your extraordinary journey at bintan island!", image: UIImage(named: "logo_nature")!)
    ]
}
