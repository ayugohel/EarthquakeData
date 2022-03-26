//
//  EarthquakeModel.swift
//  earthquakeDemo
//
//  Created by Ayushi on 2022-03-26.
//

import Foundation

struct DataModel: Codable {
    let earthquakes: [EarthquakeModel]?
}

// MARK: - EarthquakeModel
struct EarthquakeModel: Codable {
    let datetime: String
    let depth, lng: Double
    let src: String
    let eqid: String
    let magnitude, lat: Double
}
