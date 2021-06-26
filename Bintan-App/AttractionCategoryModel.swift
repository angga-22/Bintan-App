//
//  AttractionCategory.swift
//  Bintan-App
//
//  Created by angga saputra on 23/06/21.
//

import Foundation
struct AttractionModel: Codable {
    var response: [Attraction]?
}

struct Attraction: Codable {
    var attractionCategory: String?
    var attractionDetails: [AttractionDetails]?
}

struct AttractionDetails: Codable {
    var name: String?
    var location: String?
    var latlong: Array<Double>?
    var availableHours: String?
    var image: String?
    var description: String?
    var isAddToItinerary: Bool
}
