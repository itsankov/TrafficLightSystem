//
//  CarModelErrorTests.swift
//  TrafficLightSystemTests
//
//  Created by Ivelin Tsankov on 14.05.24.
//

@testable import TrafficLightSystem
import XCTest

final class CarModelErrorTests: XCTestCase {

    func test_lessLengthError() throws {
        let error = CarModelError.lessLength
        
        XCTAssertTrue(error.errorDescription == "Length of car model should be more than 2 characters")
        XCTAssertTrue(error.titleDescription == "Car model error")
    }
    
    func test_noneError() throws {
        let error = CarModelError.none
        
        XCTAssertTrue(error.errorDescription == "None")
        XCTAssertTrue(error.titleDescription == "Car model error")
    }
}
