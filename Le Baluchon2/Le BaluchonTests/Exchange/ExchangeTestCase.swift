//
//  ExchangeResponseCase.swift
//  Le BaluchonTests
//
//  Created by Anthony Laurent on 28/02/2022.
//

import XCTest
@testable import Le_Baluchon

class ExchangeTestCase: XCTestCase {
    func testGetExchangeFailedCallbackIfError() {
        // Given
        let exchangeService = ExchangeService( exchangeSession: URLSessionFake(data: nil, response: nil, error: FakeExchangeResponseData.error))

        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        exchangeService.getExchange { (success,Currency) in
            // Then
            
            
            XCTAssertFalse(success)
            XCTAssertNotNil(Currency)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)

    }
//
    func testGetExchangeFailedCallbackIfNoData() {
        // Given
        let exchangeService = ExchangeService( exchangeSession: URLSessionFake(data: nil, response: nil, error: nil))

        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        exchangeService.getExchange { (success, Currency) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNotNil(Currency)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)

    }

    func testGetExchangeFailedCallbackIfIncorrectResponse() {
        // Given
        let exchangeService = ExchangeService( exchangeSession: URLSessionFake(data: FakeExchangeResponseData.exchangeCorrectData, response: FakeExchangeResponseData.responseKO, error: nil))

        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        exchangeService.getExchange { (success, Currency) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNotNil(Currency)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)

    }

    func testGetExchangeFailedCallbackIfIncorrectData() {
        // Given
        let exchangeService = ExchangeService( exchangeSession: URLSessionFake(data: FakeExchangeResponseData.exchangeIncorrectData, response: FakeExchangeResponseData.responseOK, error: nil))

        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        exchangeService.getExchange { (success, Currency) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNotNil(Currency)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)

    }

    func testGetExchangeFailedCallbackIfNoErrorAndCorrectData() {
        // Given
        let exchangeService = ExchangeService( exchangeSession: URLSessionFake(data: FakeExchangeResponseData.exchangeCorrectData, response: FakeExchangeResponseData.responseOK, error: nil))

        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        exchangeService.getExchange { (success, Currency) in
            // Then
            let name = "AED"
            let rate = 4.115416

            XCTAssertTrue(success)
            XCTAssertNotNil(Currency)
//            XCTAssertEqual(name, Currency[0].name)
//            XCTAssertEqual(rate, Currency[0].rate)

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.01)

    }
}
