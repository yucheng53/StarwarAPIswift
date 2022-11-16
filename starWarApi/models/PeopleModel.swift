//
//  PeopleModel.swift
//  starWarApi
//
//  Created by cheng on 11/11/22.
//

import Foundation

struct People: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Result]?
}
struct Result: Codable {
    let name, height, mass, hair_color: String?
    let skin_color, eye_color, birth_year: String?
    let gender: String?
    let homeworld: String?
    let films, species, vehicles, starships: [String]?
    let created, edited: String?
    let url: String?
}
