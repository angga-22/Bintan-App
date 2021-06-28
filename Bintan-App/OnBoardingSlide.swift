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
        OnBoardingSlide(title: "Plan your Bintan Trip", description: "For your dream destination, of course you want to plan everything well. No need to worry because all information have been covered here, including route map, weather, and covid-19 health protocol.", image: UIImage(named: "boarding1")!),
        OnBoardingSlide(title: "Find your favorite places", description: "Run through every great places in Bintan even before you are arrive. Not just a basic information but also estimated cost and way to reach the place.", image: UIImage(named: "boarding2")!),
        OnBoardingSlide(title: "Let’s Explore", description: "What are you waiting for? It’s now or never!", image: UIImage(named: "boarding3")!)
    ]
}
