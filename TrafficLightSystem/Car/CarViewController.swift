//
//  CarViewController.swift
//  TrafficLightSystem
//
//  Created by Ivelin Tsankov on 13.05.24.
//

import UIKit
import Combine

class CarViewController: UIViewController, Storyboarded {
    var viewModel: CarViewModel = CarViewModel()
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var carModelTextView: UITextView!
    
    private var cancellables: Set<AnyCancellable> = .init()
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bind()
    }
    
    func bind() {
        carModelTextView.textPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.carModel, on: viewModel)
            .store(in: &cancellables)
        
        viewModel.carModelValidationResult
            .sink {_ in } receiveValue: { [weak self] error in
                if error == .none {
                    self?.navigateToTrafficLight()
                } else {
                    self?.showAlertMessage(title: error.titleDescription!, message: error.errorDescription!)
                }
            }
            .store(in: &cancellables)
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        viewModel.validateCarModel()
    }
    
    private func navigateToTrafficLight() {
        coordinator?.trafficLight(carModel: viewModel.carModel)
    }
}

