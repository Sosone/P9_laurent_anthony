//
//  ExchangeService.swift
//  Le Baluchon
//
//  Created by Anthony Laurent on 01/02/2022.
//

import Foundation

protocol ExchangeServiceDelegate: class
{
    func ratesUpdated(result: [Currency])
}

class ExchangeService {
    
    weak var delegate: ExchangeServiceDelegate?
    
    func updateRates(base: String) {
       
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=526d3e48bd3fa11ca6029c1a5d1682dd&base=\(base)")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print("ERROR")
            }
            else if let content = data
                , let response = try? JSONDecoder().decode(FixerRatesResponse.self, from: content)
            {
                var currencies = [Currency]()
                response.rates.forEach { key, value in
                    currencies.append(Currency(name: key, rate: value))
                }
                self.delegate?.ratesUpdated(result: currencies)
            }
            else
            {
                    print("ANOTHER ERROR")
            }
        }
        task.resume()
    }
}

