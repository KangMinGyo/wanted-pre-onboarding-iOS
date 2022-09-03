//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by KangMingyo on 2022/08/30.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let cityNameArr = ["gongju", "Gwangju", "Gumi", "Gunsan", "Daegu", "Daejeon", "Mokpo", "Busan", "Seosan", "Seoul", "Sokcho", "Suwon", "Suncheon", "Ulsan", "Iksan", "Jeonju", "Jeju", "Cheonan", "Cheongju", "Chuncheon"]
    let cityNameArr_Kr = ["공주시", "광주광역시", "구미시", "군산시", "대구광역시", "대전광역시", "목포시", "부산광역시", "서산시", "서울특별시", "속초시", "수원시", "순천시", "울산광역시", "익산시", "전주시", "제주특별자치도", "천안시", "청주시", "춘천시"]
    
    //도시이름, 날씨 아이콘, 현재기온, 체감기온, 헌재습도, 최저기온, 최고기온, 기압, 풍속, 날씨설명
    var name: [String] = []
    var icon: [String] = []
    var temp: [Float] = []
    var hum: [Int] = []
    
    var highestTemp: [Float] = []
    var minimumTemp: [Float] = []
    var windChill: [Float] = []

    var pressure: [Int] = []
    var windSpeed: [Float] = []
    var weatherDescription: [String] = []
    
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
                                
                                self.highestTemp.append(weatherResponse.main.temp_max)
                                self.minimumTemp.append(weatherResponse.main.temp_min)
                                self.windChill.append(weatherResponse.main.feels_like)
                                
                                self.pressure.append(weatherResponse.main.pressure)
                                self.windSpeed.append(weatherResponse.wind.speed)
                                self.weatherDescription.append(weatherResponse.weather[0].description)
                            
                                self.weatherTableView.reloadData()
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
        cell.tempLabel.text = "\(Int(UnitTemperature.celsius.converter.value(fromBaseUnitValue: Double(temperature))))°"
        cell.humLabel.text = "습도 \(hum[indexPath.row])%"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = WeatherDetailViewController()
        let Celsius = UnitTemperature.celsius
        nextVC.cityNameLabel.text = name[indexPath.row]
        nextVC.weatherIcon.setImageUrl(icon[indexPath.row])
        nextVC.tempLabel.text = "\(Int(Celsius.converter.value(fromBaseUnitValue: Double(temp[indexPath.row]))))°"
        nextVC.descriptionLabel.text = weatherDescription[indexPath.row]
        
        nextVC.highestTempLabel.text = "최고 \(Int(Celsius.converter.value(fromBaseUnitValue: Double(highestTemp[indexPath.row]))))°      "
        nextVC.minimumTempLabel.text = "최저 \(Int(Celsius.converter.value(fromBaseUnitValue: Double(minimumTemp[indexPath.row]))))°"
        nextVC.windChillLabel.text = "체감기온 \(Int(Celsius.converter.value(fromBaseUnitValue: Double(windChill[indexPath.row]))))°"
        
        nextVC.humLabel.text = "습도 \(hum[indexPath.row])%   "
        nextVC.pressureLabel.text = "기압 \(pressure[indexPath.row])hPa   "
        nextVC.windSpeedLabel.text = "풍속 \(windSpeed[indexPath.row])m/s"
        self.show(nextVC, sender: self)
    }
}
