//
//  UIView.swift
//  WeatherApp
//
//  Created by KangMingyo on 2022/08/30.
//

import UIKit

extension UIView {
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

extension UIImageView {
    //이미지 캐싱
    func setImageUrl(_ iconName:String){
        let imageURL = "https://openweathermap.org/img/wn/\(iconName)@2x.png"
        let cachedKey = NSString(string: iconName)
        
        if let cachedImage = ImageCacheManager.shared.object(forKey: cachedKey){
            self.image = cachedImage
            return
        }
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: imageURL){
                URLSession.shared.dataTask(with: url) { (data, result, error) in
                    if let _ = error {
                        DispatchQueue.main.async {
                            self.image = UIImage()
                        }
                        return
                    }
                    DispatchQueue.main.async {
                        if let data = data, let image = UIImage(data: data){
                            ImageCacheManager.shared.setObject(image, forKey: cachedKey)
                            self.image = image
                        }
                    }
                }
                .resume()
            }
        }
    }
}
