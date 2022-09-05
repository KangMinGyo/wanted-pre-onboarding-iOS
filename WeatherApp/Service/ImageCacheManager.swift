//
//  ImageCacheManager.swift
//  WeatherApp
//
//  Created by KangMingyo on 2022/09/01.
//

import UIKit

class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}
