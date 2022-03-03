//
//  WeatherTest.swift
//  Le BaluchonTests
//
//  Created by Anthony Laurent on 28/02/2022.
//


import XCTest
@testable import Le_Baluchon

class WeatherTestCase: XCTestCase {
    func testGetWeatherFailedCallbackIfError() {
        // Given
        let weatherService = WeatherService( weatherSession: URLSessionFake(data: nil, response: nil, error: FakeWeatherResponseData.error))
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weatherService.getWeather { (success, Weather) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(Weather)
            expectation.fulfill()
        }
     
        wait(for: [expectation], timeout: 0.01)
        
    }
    
    func testGetWeatherFailedCallbackIfNoData() {
        // Given
        let weatherService = WeatherService( weatherSession: URLSessionFake(data: nil, response: nil, error: nil))
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weatherService.getWeather { (success, Weather) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(Weather)
            expectation.fulfill()
        }
     
        wait(for: [expectation], timeout: 0.01)
        
    }
    
    func testGetWeatherFailedCallbackIfIncorrectResponse() {
        // Given
        let weatherService = WeatherService( weatherSession: URLSessionFake(data: FakeWeatherResponseData.weatherCorrectData, response: FakeWeatherResponseData.responseKO, error: nil))
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weatherService.getWeather { (success, Weather) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(Weather)
            expectation.fulfill()
        }
     
        wait(for: [expectation], timeout: 0.01)
        
    }
    
    func testGetWeatherFailedCallbackIfIncorrectData() {
        // Given
        let weatherService = WeatherService( weatherSession: URLSessionFake(data: FakeWeatherResponseData.weatherIncorrectData, response: FakeWeatherResponseData.responseOK, error: nil))
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weatherService.getWeather { (success, Weather) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(Weather)
            expectation.fulfill()
        }
     
        wait(for: [expectation], timeout: 0.01)
        
    }
    
    func testGetWeatherFailedCallbackIfNoErrorAndCorrectData() {
        // Given
        let weatherService = WeatherService( weatherSession: URLSessionFake(data: FakeWeatherResponseData.weatherCorrectData, response: FakeWeatherResponseData.responseOK, error: nil))
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weatherService.getWeather { (success, Weather) in
            // Then
            let icon = "03d.png"
            let name = "New York"
            let description = "peu nuageux"
            let temperature = "-14.44"
            
            XCTAssertTrue(success)
            XCTAssertNotNil(Weather)
            XCTAssertEqual(icon, Weather?.cityOne.icon)
            XCTAssertEqual(name, Weather?.cityOne.name)
            XCTAssertEqual(description, Weather?.cityOne.description)
            XCTAssertEqual(temperature, Weather?.cityOne.temperature.description)
            
            expectation.fulfill()
        }
     
        wait(for: [expectation], timeout: 0.01)
        
    }
}
