//
//  Coordinator.swift
//  TrafficLightSystem
//
//  Created by Ivelin Tsankov on 14.05.24.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
