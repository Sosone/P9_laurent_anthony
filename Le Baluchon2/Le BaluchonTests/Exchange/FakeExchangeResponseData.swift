//
//  FakeResponseData.swift
//  Le BaluchonTests
//
//  Created by Anthony Laurent on 28/02/2022.
//

import Foundation

class FakeExchangeResponseData {
    
    static var exchangeCorrectData : Data? {
        let bundle = Bundle(for: FakeExchangeResponseData.self)
        let url = bundle.url(forResource: "Currency", withExtension: "json")
        return try! Data(contentsOf: url!)
    }
    
    static let exchangeIncorrectData = "erreur".data(using: .utf8)!
    
    
    static let responseOK = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 200, httpVersion: nil, headerFields: nil)!

    static let responseKO = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 500, httpVersion: nil, headerFields: nil)!
    
    class ExchangeError: Error {}
    static let error = ExchangeError()
}
