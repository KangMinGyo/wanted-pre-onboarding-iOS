//
//  Weather.swift
//  WeatherApp
//
//  Created by KangMingyo on 2022/08/31.
//

import Foundation

struct Weather: Codable {
    var weather: [weather]
    var main: Main
    var wind: Wind
}

struct weather: Codable {
    var description: String
    var icon: String
}

struct Main: Codable {
    var temp: Float
    var feels_like: Float
    var temp_min: Float
    var temp_max: Float
    var pressure: Int
    var humidity: Int
}

struct Wind: Codable {
    var speed: Float
}
