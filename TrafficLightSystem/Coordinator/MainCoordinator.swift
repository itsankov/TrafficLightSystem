//
//  MainCoordinator.swift
//  TrafficLightSystem
//
//  Created by Ivelin Tsankov on 14.05.24.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        carView()
    }
    
    func carView() {
        let vc = CarViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func trafficLight(carModel: String) {
        let vc = TrafficLightViewController.instantiate()
        vc.carModel = carModel
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
