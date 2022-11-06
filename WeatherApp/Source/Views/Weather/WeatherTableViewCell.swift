//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by KangMingyo on 2022/08/30.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
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
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cityNameLabel)
        addSubview(weatherIcon)
        addSubview(stackView)
        
        [tempLabel, humLabel].forEach {
            self.stackView.addArrangedSubview($0)
        }
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        weatherIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        weatherIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        weatherIcon.heightAnchor.constraint(equalToConstant: 60).isActive = true
        weatherIcon.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cityNameLabel.leadingAnchor.constraint(equalTo: weatherIcon.trailingAnchor, constant: 10).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
}
