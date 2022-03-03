//
//  TranslateService.swift
//  Le Baluchon
//
//  Created by Anthony Laurent on 08/02/2022.
//

import Foundation

class TranslateService {

    static var shared = TranslateService()

    private init() {}

    private var translateSession = URLSession(configuration: .default)

    init(translateSession: URLSession) {
        self.translateSession = translateSession
    }

    private var task: URLSessionDataTask?

    func getTranslate(text: String, callback: @escaping (Bool, Translate?) ->Void) {

        let urlString = "https://api.mymemory.translated.net/get?q=\(text)&langpair=fr-CA|en-GB"
        
        
        guard let urlStringEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            , let translateUrl = URL(string: urlStringEncoded)
        else
        {
            callback(false, nil)
            return
        }
        
        task?.cancel()

        task = translateSession.dataTask(with: translateUrl) { (data, response, error) in
            guard let data = data
                    , error == nil
                    , let response = response as? HTTPURLResponse
                    , response.statusCode == 200
                    , let translateResponse = try? JSONDecoder().decode(TranslateResponse.self, from: data)
            else {
                //print(String(data: data!, encoding: .utf8))
                callback(false, nil)
                return
            }
            
            let textTrad = translateResponse.responseData.translatedText.description
            
            let translate = Translate(textTranslate: textTrad)
                
            
            callback(true, translate)

        }
        task?.resume()
    }
}

