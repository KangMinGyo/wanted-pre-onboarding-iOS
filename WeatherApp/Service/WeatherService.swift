//
//  WeatherService.swift
//  WeatherApp
//
//  Created by KangMingyo on 2022/08/31.
//

import Foundation

//Error
enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}

class WeatherService {
    //Plist에서 APIKEY 가져오기
    private var apiKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "KeyList", ofType: "plist") else {
                fatalError("Couldn't find KeyList")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            
            guard let value = plist?.object(forKey: "OpenWeatherAPI_KEY") as? String else {
                fatalError("Couldn't find key 'OpenWeatherAPI_KEY")
            }
            return value
        }
    }
    
    func getWeather(completion: @escaping (Result<Weather, NetworkError>) -> Void) {
            
            // API 호출을 위한 URL
            let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=\(apiKey)")
            guard let url = url else {
                return completion(.failure(.badUrl))
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    return completion(.failure(.noData))
                }

                let weatherResponse = try? JSONDecoder().decode(Weather.self, from: data)
                
                if let weatherResponse = weatherResponse {
                    print(weatherResponse)
                    completion(.success(weatherResponse))
                } else {
                    completion(.failure(.decodingError))
                }
            }.resume()
        }
}
