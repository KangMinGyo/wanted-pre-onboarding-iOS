//
//  WeatherDetailView.swift
//  WeatherApp
//
//  Created by KangMingyo on 2022/09/01.
//

import UIKit

class WeatherDetailView: UIView {
    
    let cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    let weatherIcon: UIImageView = {
       let image = UIImageView()
        return image
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50)
        return label
    }()
    
    let windChillLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let humLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let highestTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let minimumTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let pressureLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let windSpeedLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    let tempStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [highestTempLabel, minimumTempLabel].forEach {
            self.tempStackView.addArrangedSubview($0)
        }
        
        [humLabel, pressureLabel, windSpeedLabel].forEach {
            self.stackView.addArrangedSubview($0)
        }

        addView()
        configure()
    }

    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        addSubview(cityNameLabel)
        addSubview(descriptionLabel)
        addSubview(weatherIcon)
        addSubview(tempLabel)
        addSubview(windChillLabel)
        addSubview(tempStackView)
        addSubview(stackView)
    }
    
    func configure() {
        
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cityNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 10).isActive = true
        
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        weatherIcon.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        weatherIcon.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30).isActive = true
        weatherIcon.heightAnchor.constraint(equalToConstant: 128).isActive = true
        weatherIcon.widthAnchor.constraint(equalToConstant: 128).isActive = true
        
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        tempLabel.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor, constant: 30).isActive = true
        
        windChillLabel.translatesAutoresizingMaskIntoConstraints = false
        windChillLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        windChillLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 5).isActive = true
        
        tempStackView.translatesAutoresizingMaskIntoConstraints = false
        tempStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        tempStackView.topAnchor.constraint(equalTo: windChillLabel.bottomAnchor, constant: 30).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: tempStackView.bottomAnchor, constant: 30).isActive = true
    }
    
}
