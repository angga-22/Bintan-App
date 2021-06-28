//
//  AttractionSlide.swift
//  Bintan-App
//
//  Created by angga saputra on 22/06/21.
//

import UIKit

struct AttractionBannerSlide {
    let name: String
    let image: UIImage
}

extension AttractionBannerSlide {
    static var dataAttractionBanner = [
        AttractionBannerSlide(name: "Bintan Spa Villa Resort", image: UIImage(named: "bintanSpaVillaResort")!),
        AttractionBannerSlide(name: "Sakerah Beach", image: UIImage(named: "pantaiSakerah")!),
        AttractionBannerSlide(name: "Lagoon Resort Bintan", image: UIImage(named: "bintanLagoonResort")!),
        AttractionBannerSlide(name: "Bintan Residence", image: UIImage(named: "theResidenceBintan")!),
        AttractionBannerSlide(name: "Safari Lagoi Bintan", image: UIImage(named: "safariLagoiBintan")!),
        AttractionBannerSlide(name: "Cassia Bintan", image: UIImage(named: "cassiaBintan")!),
        AttractionBannerSlide(name: " Holiday Villa", image: UIImage(named: "holidayVillaPantaiIndah")!),
    ]
}
