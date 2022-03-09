//
//  API.swift
//  Le Baluchon
//
//  Created by Anthony Laurent on 31/01/2022.
//

import Foundation

struct API {
    
    struct FixerAPI {
        static let baseURL = "http://data.fixer.io/api/latest?access_key=526d3e48bd3fa11ca6029c1a5d1682dd&base=EUR)"
    }
    
    struct TranslateAPI {
        static let baseURL = "https://api.mymemory.translated.net/get?q=Bonjour&langpair=fr-CA|en-GB"
    }
    
    struct OpenWeatherMap {
        static let baseURL = "https://api.openweathermap.org/data/2.5/group?id=5128638,2984512&APPID=5473d0019b4ef195036ca00c8cc3e516&lang=fr&units=metric"
    }
}
