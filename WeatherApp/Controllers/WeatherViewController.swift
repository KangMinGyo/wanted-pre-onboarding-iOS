//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by KangMingyo on 2022/08/30.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let cityNameArr = ["gongju", "Gwangju", "Gumi", "Gunsan", "Daegu", "Daejeon", "Mokpo", "Busan", "Seosan", "Seoul", "Sokcho", "Suwon", "Suncheon", "Ulsan", "Iksan", "Jeonju", "Jeju", "Cheonan", "Cheongju", "Chuncheon"]
    
    var weatherData: [Weather] = []
//    var weather: weather?
    var main: Main?
//    var wind: Wind?
    var name: [String] = []

    private let weatherTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Weather"
        
        fetchData()
        configure()
        
    }
    
    func fetchData() {
        for i in 0..<cityNameArr.count {
            WeatherService().getWeather(cityName: cityNameArr[i]) { result in
                        switch result {
                        case .success(let weatherResponse):
                            DispatchQueue.main.async {
                                self.name.append(weatherResponse.name ?? "")
                                print(self.name.count)
                                self.weatherTableView.reloadData()
//                                self.weather = weatherResponse.weather.first
//                                self.main = weatherResponse.main
//                                self.wind = weatherResponse.wind
//                                self.name = weatherResponse.name
                            }
                        case .failure(_ ):
                            print("error")
                }
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
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableViewCell
        cell.cityNameLabel.text = name[indexPath.row]
//        cell.tempLabel.text = main?.temp[indexPath.row]
        return cell
    }
    
}
