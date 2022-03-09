//
//  ExchangeService.swift
//  Le Baluchon
//
//  Created by Anthony Laurent on 01/02/2022.
//

import Foundation

class ExchangeService {
    
    static var shared = ExchangeService()
    
    private init() {}
    
    
    private let exchangeUrl = URL(string: "http://data.fixer.io/api/latest?access_key=526d3e48bd3fa11ca6029c1a5d1682dd&base=EUR")!
    
    private var exchangeSession = URLSession(configuration: .default)

    init(exchangeSession: URLSession) {
        self.exchangeSession = exchangeSession
    }
    
    private var task: URLSessionDataTask?
    
    func getExchange(callback: @escaping (Bool, [Currency]) ->Void) {
        
        task = exchangeSession.dataTask(with: exchangeUrl) { (data, response, error) in
            guard let data = data
                    , error == nil
                    , let response = response as? HTTPURLResponse
                    , response.statusCode == 200
                    , let exchangeResponse = try? JSONDecoder().decode(FixerRatesResponse.self, from: data)
            else {
                callback(false, [])
                return
            }
            
            var currencies = [Currency]()
            exchangeResponse.rates.forEach { key, value in
                currencies.append(Currency(name: key, rate: value))
            }
            callback(true, currencies)
        
          
        }
        self.task?.resume()
    }
}


