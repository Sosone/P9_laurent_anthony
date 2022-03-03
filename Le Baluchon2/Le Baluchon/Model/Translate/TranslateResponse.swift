//
//  Translate.swift
//  Le Baluchon
//
//  Created by Anthony Laurent on 08/02/2022.
//

import Foundation

struct TranslateResponse: Codable {
    
    let responseData: ResponseData
}

struct ResponseData: Codable {
    
    let translatedText: String
}

