//
//  PlanetModel.swift
//  starWarApi
//
//  Created by cheng on 11/12/22.
//

import Foundation
struct Planet: Codable {
    let name, rotationPeriod, orbital_period, diameter: String?
    let climate, gravity, terrain, surfaceWater: String?
    let population: String?
    let residents, films: [String]?
    let created, edited: String?
    let url: String?
}
