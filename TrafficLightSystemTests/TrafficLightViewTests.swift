//
//  TrafficLightViewTests.swift
//  TrafficLightSystemTests
//
//  Created by Ivelin Tsankov on 14.05.24.
//

@testable import TrafficLightSystem
import XCTest
import Combine

final class TrafficLightViewTests: XCTestCase {
    private var subject: TrafficLightView!
    private var trafficLightViewController: TrafficLightViewController!

    override func setUp() {
        super.setUp()
        
        trafficLightViewController = TrafficLightViewController.instantiate()
        trafficLightViewController.loadView()
        trafficLightViewController.viewDidLoad()
        
        subject = trafficLightViewController.trafficLightView
    }
    
    override func tearDown() {
        subject = nil
        trafficLightViewController = nil
        
        super.tearDown()
    }

    func test_asd() {
        var trafficLight = TrafficLight.red
        XCTAssertTrue(trafficLight.nextTrafficLight() == .yellow)
        XCTAssertTrue(trafficLight.time() == 4)

        trafficLight = .yellow
        XCTAssertTrue(trafficLight.nextTrafficLight() == .green)
        XCTAssertTrue(trafficLight.time() == 1)
        
        trafficLight = .green
        XCTAssertTrue(trafficLight.nextTrafficLight() == .red)
        XCTAssertTrue(trafficLight.time() == 4)


    }
}
