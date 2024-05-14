//
//  CarViewModel.swift
//  TrafficLightSystem
//
//  Created by Ivelin Tsankov on 13.05.24.
//

import UIKit
import Combine

class CarViewModel {
    @Published var carModel: String = ""
    
    let carModelValidationResult = PassthroughSubject<CarModelError, Never>()
        
    func validateCarModel() {
        carModel = carModel.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard carModel.count > 2 else {
            carModelValidationResult.send(.lessLength)
            return
        }
        
        carModelValidationResult.send(.none)
    }
}
