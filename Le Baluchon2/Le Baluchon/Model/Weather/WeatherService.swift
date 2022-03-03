//
//  Weather.swift
//  Le Baluchon
//
//  Created by Anthony Laurent on 01/02/2022.
//
import Foundation

class WeatherService {
    
    static var shared = WeatherService()
    private init() {}
    
    
    private let weatherUrl = URL(string: "https://api.openweathermap.org/data/2.5/group?id=5128638,2984512&APPID=5473d0019b4ef195036ca00c8cc3e516&lang=fr&units=metric")!
    
    private var weatherSession = URLSession(configuration: .default)

    init(weatherSession: URLSession) {
        self.weatherSession = weatherSession
    }
    
    private var task: URLSessionDataTask?
    
    func getWeather(callback: @escaping (Bool, Weather?) ->Void) {
        
        task = weatherSession.dataTask(with: weatherUrl) { (data, response, error) in
            guard let data = data
                    , error == nil
                    , let response = response as? HTTPURLResponse
                    , response.statusCode == 200
                    , let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            else {
                callback(false, nil)
                return
            }
            
            let first = weatherResponse.list[0]
            let firstWeather = first.weather[0]
            let second = weatherResponse.list[1]
            let secondWeather = second.weather[0]
            
            let weather = Weather(
                cityOne: CityWeather(
                    icon: firstWeather.icon
                    , name: first.name
                    , description: firstWeather.description
                    , temperature: first.main.temp
                )
                , cityTwo: CityWeather(
                    icon: secondWeather.icon
                    , name: second.name
                    , description: secondWeather.description
                    , temperature: second.main.temp
                )
                , date: Date(timeIntervalSince1970: first.dt)
            )
            
            callback(true, weather)
        }
        task?.resume()
    }
}
