//
//  TranslateTestCase.swift
//  Le BaluchonTests
//
//  Created by Anthony Laurent on 01/03/2022.
//

import XCTest
@testable import Le_Baluchon

class TranslateTestCase: XCTestCase {

    func testGetTranslateFailedCallbackIfError() {
        // Given
        let translateService = TranslateService( translateSession: URLSessionFake(data: nil, response: nil, error: FakeTranslateResponseData.error))
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translateService.getTranslate(text: "pomme") { (success, Translate) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(Translate)
            expectation.fulfill()
        }
     
        wait(for: [expectation], timeout: 0.01)
        
    }
    
    func testGetTranslateFailedCallbackIfNoData() {
        // Given
        let translateService = TranslateService( translateSession: URLSessionFake(data: nil, response: nil, error: nil))
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translateService.getTranslate(text: "pomme"){ (success, Translate) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(Translate)
            expectation.fulfill()
        }
     
        wait(for: [expectation], timeout: 0.01)
        
    }
    
    func testGetTranslateFailedCallbackIfIncorrectResponse() {
        // Given
        let translateService = TranslateService( translateSession: URLSessionFake(data: FakeTranslateResponseData.translateCorrectData, response: FakeTranslateResponseData.responseKO, error: nil))
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translateService.getTranslate(text:"pomme") { (success, Translate) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(Translate)
            expectation.fulfill()
        }
     
        wait(for: [expectation], timeout: 0.01)
        
    }
    
    func testGetTranslateFailedCallbackIfIncorrectData() {
        // Given
        let translateService = TranslateService( translateSession: URLSessionFake(data: FakeTranslateResponseData.translateIncorrectData, response: FakeTranslateResponseData.responseOK, error: nil))
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translateService.getTranslate (text:"pomme"){ (success, Translate) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(Translate)
            expectation.fulfill()
        }
     
        wait(for: [expectation], timeout: 0.01)
        
    }
    
    func testGetTranslateFailedCallbackIfNoErrorAndCorrectData() {
        // Given
        let translateService = TranslateService( translateSession: URLSessionFake(data: FakeTranslateResponseData.translateCorrectData, response: FakeTranslateResponseData.responseOK, error: nil))
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translateService.getTranslate(text:"Traduis ton texte ici!") { (success, Translate) in
            // Then
            let text = "Translate your text here!"
            
            XCTAssertTrue(success)
            XCTAssertNotNil(Translate)
            XCTAssertEqual(text, Translate?.textTranslate)
        
            
            expectation.fulfill()
        }
     
        wait(for: [expectation], timeout: 0.01)
        
    }
}
