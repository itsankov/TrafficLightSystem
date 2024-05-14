//
//  CarModelError.swift
//  TrafficLightSystem
//
//  Created by Ivelin Tsankov on 14.05.24.
//

import Foundation

enum CarModelError: Error {
    case lessLength
    case none
}

extension CarModelError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .lessLength:
            return "Length of car model should be more than 2 characters"
        case .none:
            return "None"
        }
    }
    
    public var titleDescription: String? {
        return "Car model error"
    }
}
