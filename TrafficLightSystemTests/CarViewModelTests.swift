//
//  CarViewModelTests.swift
//  TrafficLightSystemTests
//
//  Created by Ivelin Tsankov on 14.05.24.
//

@testable import TrafficLightSystem
import XCTest
import Combine

final class CarViewModelTests: XCTestCase {
    private var subject: CarViewModel!
    private var cancellables: Set<AnyCancellable> = []

    override func setUp() {
        super.setUp()
        
        subject = CarViewModel()
    }
    
    override func tearDown() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
        subject = nil
        
        super.tearDown()
    }
    
    func test_isCarModelValid_carModelIsEmpty() {
        subject.carModel = ""
        subject.validateCarModel()
        
        subject.carModelValidationResult.sink {
            XCTAssertTrue($0 == .lessLength)
        }
        .store(in: &cancellables)
    }
    
    func test_isCarModelValid_carModelIsLessLength() {
        subject.carModel = "ca"
        subject.validateCarModel()
        
        subject.carModelValidationResult.sink {
            XCTAssertTrue($0 == .lessLength)
        }
        .store(in: &cancellables)
    }
    
    func test_isCarModelValid_carModelHasSpecialCharapters() {
        subject.carModel = "$%^"
        subject.validateCarModel()
        
        subject.carModelValidationResult.sink {
            XCTAssertTrue($0 == .none)
        }
        .store(in: &cancellables)
    }
    
    func test_isCarModelValid_carModelWhitespaces() {
        subject.carModel = "                       "
        subject.validateCarModel()
        
        subject.carModelValidationResult.sink {
            XCTAssertTrue($0 == .lessLength)
        }
        .store(in: &cancellables)
    }
    
    func test_isCarModelValid_carModelMultipleLines() {
        subject.carModel = """
             \
             \
             \
              
             """
        subject.validateCarModel()
        
        subject.carModelValidationResult.sink {
            XCTAssertTrue($0 == .lessLength)
        }
        .store(in: &cancellables)
    }
    
    func test_isCarModelValid_carModelMultipleLinesAndWhitespaceWithText() {
        subject.carModel = """
             \
             \
             car model \
              
             """
        subject.validateCarModel()
        
        subject.carModelValidationResult.sink {
            XCTAssertTrue($0 == .none)
        }
        .store(in: &cancellables)
    }
    
    func test_isCarModelValid_carModelLongText() {
        subject.carModel = "What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        subject.validateCarModel()
        
        subject.carModelValidationResult.sink {
            XCTAssertTrue($0 == .none)
        }
        .store(in: &cancellables)
    }
}
