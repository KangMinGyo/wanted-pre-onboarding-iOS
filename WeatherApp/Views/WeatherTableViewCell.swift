//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by KangMingyo on 2022/08/30.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    //도시이름, 날씨 아이콘, 현재기온, 현재습도
    lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    lazy var weatherIcon: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    lazy var humLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cityNameLabel)
        addSubview(weatherIcon)
        addSubview(tempLabel)
        addSubview(humLabel)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cityNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        weatherIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        weatherIcon.leadingAnchor.constraint(equalTo: cityNameLabel.trailingAnchor, constant: 20).isActive = true
        weatherIcon.heightAnchor.constraint(equalToConstant: 60).isActive = true
        weatherIcon.widthAnchor.constraint(equalToConstant: 60).isActive = true
//
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        tempLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
//
        humLabel.translatesAutoresizingMaskIntoConstraints = false
        humLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: -20).isActive = true
        humLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
}
