//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by KangMingyo on 2022/08/30.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let cityNameArr = ["gongju", "Gwangju", "Gumi", "Gunsan", "Daegu", "Daejeon", "Mokpo", "Busan", "Seosan", "Seoul", "Sokcho", "Suwon", "Suncheon", "Ulsan", "Iksan", "Jeonju", "Jeju", "Cheonan", "Cheongju", "Chuncheon"]
    let cityNameArr_Kr = ["공주", "광주", "구미", "군산", "대구", "대전", "목포", "부산", "서산", "서울", "속초", "수원", "순천", "울산", "익산", "전주", "제주", "천안", "청주", "춘천"]
    
    var name: [String] = []
    var icon: [String] = []
    var temp: [Float] = []
    var hum: [Int] = []

    
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
        for index in 0..<cityNameArr.count {
            WeatherService().getWeather(cityName: cityNameArr[index]) { result in
                        switch result {
                        case .success(let weatherResponse):
                            DispatchQueue.main.async {
                                self.name.append(self.cityNameArr_Kr[index])
                                self.icon.append(weatherResponse.weather[0].icon)
                                self.temp.append(weatherResponse.main.temp)
                                self.hum.append(weatherResponse.main.humidity)
                            
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
        weatherTableView.rowHeight = 100
        weatherTableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: "cell")
        weatherTableView.pin(to: view)
    }
    
    func setTableViewDelegate() {
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
    }
    
    func setImage(imageURL: String) {
        if let cacheImage = ImageCacheManager.shared.object(forKey: imageURL as NSString) {
            
        }
    }
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableViewCell
        let temperature = temp[indexPath.row]
        cell.cityNameLabel.text = name[indexPath.row]
        cell.weatherIcon.setImageUrl(icon[indexPath.row])
        cell.tempLabel.text = "\(Int(UnitTemperature.celsius.converter.value(fromBaseUnitValue: Double(temperature))))°C"
//        cell.humLabel.text = "\(hum[indexPath.row])"
        

        return cell
    }
    
}
