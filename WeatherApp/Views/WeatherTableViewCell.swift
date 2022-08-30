//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by KangMingyo on 2022/08/30.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    var item: String? {
        didSet {
            self.cityNameLabel.text = item
        }
    }
    //도시이름, 날씨 아이콘, 현재기온, 현재습도
    private let cityNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let weatherIcon: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let humLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cityNameLabel)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {

        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        cityNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
    }
}
