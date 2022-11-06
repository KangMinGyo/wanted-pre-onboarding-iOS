//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by KangMingyo on 2022/09/01.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    let weatherDetail: WeatherDetailView = {
        let view = WeatherDetailView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .systemBackground
        
        addView()
        configure()
    }
    
    func addView() {
        view.addSubview(weatherDetail)
    }
    

    func configure() {
        weatherDetail.translatesAutoresizingMaskIntoConstraints = false
        weatherDetail.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        weatherDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        weatherDetail.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        weatherDetail.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
