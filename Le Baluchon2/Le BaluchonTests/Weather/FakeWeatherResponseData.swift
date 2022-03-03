//
//  FakeWeatherResponseData.swift
//  Le BaluchonTests
//
//  Created by Anthony Laurent on 28/02/2022.
//

import Foundation

class FakeWeatherResponseData {
    
    static var weatherCorrectData : Data? {
        let bundle = Bundle(for: FakeWeatherResponseData.self)
        let url = bundle.url(forResource: "Weather", withExtension: "json")
        return try! Data(contentsOf: url!)
    }
    
    static let weatherIncorrectData = "erreur".data(using: .utf8)!
    
    
    static let responseOK = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 200, httpVersion: nil, headerFields: nil)!

    static let responseKO = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 500, httpVersion: nil, headerFields: nil)!
    
    class WeatherError: Error {}
    static let error = WeatherError()
}
