//
//  WeatherView.swift
//  WeatherApp
//
//  Created by KangMingyo on 2022/08/30.
//

import UIKit

class WeatherView: UIView {
    
    let weatherTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addView()
        configure()
    }

    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        addSubview(weatherTableView)
    }
    
    func configure() {
        weatherTableView.translatesAutoresizingMaskIntoConstraints = false
        weatherTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        weatherTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        weatherTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        weatherTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
