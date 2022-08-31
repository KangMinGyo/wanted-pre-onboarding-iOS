//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by KangMingyo on 2022/08/30.
//

import UIKit

class WeatherViewController: UIViewController {
    
//    let items = ["서울", "부산", "대전", "대구", "광주"]
//    let temps = ["32", "30", "31", "33", "32"]
    
    var weather: weather?
    var main: Main?
    var wind: Wind?

    private let weatherTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Weather"
        configure()
        fetchData()
        
    }
    
    func fetchData() {
        WeatherService().getWeather { result in
                    switch result {
                    case .success(let weatherResponse):
                        DispatchQueue.main.async {
                            self.weather = weatherResponse.weather.first
                            self.main = weatherResponse.main
                            self.wind = weatherResponse.wind
                        }
                    case .failure(_ ):
                        print("error")
            }
        }
    }
    
    func configure() {
        view.addSubview(weatherTableView)
        setTableViewDelegate()
        weatherTableView.rowHeight = 150
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
        cell.cityNameLabel.text = "서울"
        cell.tempLabel.text = "\(main?.humidity)"
        return cell
    }
    
}
