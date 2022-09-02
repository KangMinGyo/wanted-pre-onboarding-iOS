//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by KangMingyo on 2022/09/01.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    //헌재습도 기압, 풍속
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
        label.font = UIFont.systemFont(ofSize: 50)
        return label
    }()
    
    lazy var windChillLabel: UILabel = { //체감온도
        let label = UILabel()
        return label
    }()
    
    lazy var humLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var highestTempLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var minimumTempLabel: UILabel = {
        let label = UILabel()
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
        
        [highestTempLabel, minimumTempLabel, windChillLabel].map {
            self.tempStackView.addArrangedSubview($0)
        }
        
        [humLabel, pressureLabel, windSpeedLabel].map {
            self.stackView.addArrangedSubview($0)
        }
        
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .yellow
        configure()
        data()
    }
    
    func configure() {
        
        view.addSubview(weatherIcon)
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        weatherIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        weatherIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        weatherIcon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        weatherIcon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(cityNameLabel)
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityNameLabel.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(tempLabel)
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tempLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 10).isActive = true
        
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 10).isActive = true
        
        view.addSubview(tempStackView)
        tempStackView.translatesAutoresizingMaskIntoConstraints = false
        tempStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tempStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: tempStackView.bottomAnchor, constant: 20).isActive = true
    }
    
    func data() {
        cityNameLabel.text = "서울"
        weatherIcon.image = UIImage(systemName: "circle.fill")
        tempLabel.text = "29°"
        descriptionLabel.text = "Clear Sky"
        
        highestTempLabel.text = "최고기온: 32° "
        minimumTempLabel.text = "최저기온: 25° "
        windChillLabel.text = "체감기온: 35°"
        
        humLabel.text = "습도: 70 "
        pressureLabel.text = "기압 : 1000 "
        windSpeedLabel.text = "풍속 : 10"
        
    }
}
