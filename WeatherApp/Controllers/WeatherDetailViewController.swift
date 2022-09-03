//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by KangMingyo on 2022/09/01.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    lazy var weatherIcon: UIImageView = {
       let image = UIImageView()
        return image
    }()
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50)
        return label
    }()
    
    lazy var windChillLabel: UILabel = { //체감온도
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var humLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var highestTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var minimumTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var pressureLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var windSpeedLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    var tempStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [highestTempLabel, minimumTempLabel].map {
            self.tempStackView.addArrangedSubview($0)
        }
        
        [humLabel, pressureLabel, windSpeedLabel].map {
            self.stackView.addArrangedSubview($0)
        }
        
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .systemBackground
        configure()
    }
    
    func configure() {
        
        view.addSubview(cityNameLabel)
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 10).isActive = true
        
        view.addSubview(weatherIcon)
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        weatherIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        weatherIcon.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30).isActive = true
        weatherIcon.heightAnchor.constraint(equalToConstant: 128).isActive = true
        weatherIcon.widthAnchor.constraint(equalToConstant: 128).isActive = true
        
        view.addSubview(tempLabel)
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tempLabel.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor, constant: 30).isActive = true
        
        view.addSubview(windChillLabel)
        windChillLabel.translatesAutoresizingMaskIntoConstraints = false
        windChillLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        windChillLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 5).isActive = true
        
        view.addSubview(tempStackView)
        tempStackView.translatesAutoresizingMaskIntoConstraints = false
        tempStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tempStackView.topAnchor.constraint(equalTo: windChillLabel.bottomAnchor, constant: 30).isActive = true
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: tempStackView.bottomAnchor, constant: 30).isActive = true
    }
}
