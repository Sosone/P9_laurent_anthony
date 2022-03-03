//
//  FakeTranslateResponseData.swift
//  Le BaluchonTests
//
//  Created by Anthony Laurent on 01/03/2022.
//

import Foundation

class FakeTranslateResponseData {
    
    static var translateCorrectData : Data? {
        let bundle = Bundle(for: FakeTranslateResponseData.self)
        let url = bundle.url(forResource: "Exchange", withExtension: "json")
        return try! Data(contentsOf: url!)
    }
    
    static let translateIncorrectData = "erreur".data(using: .utf8)!
    
    
    static let responseOK = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 200, httpVersion: nil, headerFields: nil)!

    static let responseKO = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 500, httpVersion: nil, headerFields: nil)!
    
    class TranslateError: Error {}
    static let error = TranslateError()
}
