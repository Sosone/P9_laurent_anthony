//
//  Weather.swift
//  Le Baluchon
//
//  Created by Anthony Laurent on 08/02/2022.
//

import Foundation

struct WeatherResponse : Codable {
    let list: [City]

    struct City: Codable {
        let dt: Double
        let name: String
        let main: Main
        let weather: [Weather]

        struct Weather: Codable {
            let id: Double
            let description: String
            
            var icon: String
            {
                switch id {
                    case 200...232:
                        return "11d.png"
                    case 300...321, 520...521:
                        return "09d.png"
                    case 511:
                        return "13d.png"
                    case 800:
                        return "01d.png"
                    case 801...804:
                        return "03d.png"
                    default:
                        return "01d.png"
                }
            }
            
        }
        
        struct Main: Codable {
            let temp: Double
        }
    }
}

