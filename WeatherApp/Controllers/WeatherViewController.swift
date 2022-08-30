//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by KangMingyo on 2022/08/30.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let items = ["서울", "부산", "대전", "대구", "광주"]
    
    private let weatherTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Weather"
        configure()
        
    }
    
    func configure() {
        view.addSubview(weatherTableView)
        setTableViewDelegate()
        weatherTableView.rowHeight = 100
        weatherTableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: "cell")
        weatherTableView.pin(to: view)
    }
    
    func setTableViewDelegate() {
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
    }
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableViewCell
        let item = self.items[indexPath.row]
        cell.item = item
        return cell
    }
    
    
}
