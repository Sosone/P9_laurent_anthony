//
//  API.swift
//  Le Baluchon
//
//  Created by Anthony Laurent on 31/01/2022.
//

import Foundation

struct API {
    
    struct FixerAPI {
        static let baseURL = "http://data.fixer.io/api/latest?"
        static let APIKey = "526d3e48bd3fa11ca6029c1a5d1682dd"
        
    }
    
    struct GoogleTranslateAPI {
        
    }
    
    struct OpenWeatherMap {
        static let baseURL = "http://api.openweathermap.org/data/2.5/forecast?id=524901&appid={API key}"
        static let APIKey = "5473d0019b4ef195036ca00c8cc3e516"
    }
}
