//
//  TrafficLightViewController.swift
//  TrafficLightSystem
//
//  Created by Ivelin Tsankov on 14.05.24.
//

import UIKit
import Combine

class TrafficLightViewController: UIViewController, Storyboarded {
    var carModel: String = ""
    
    private var viewModel: TrafficLightViewModel = TrafficLightViewModel()
    
    @IBOutlet weak var trafficLightView: TrafficLightView!
    @IBOutlet weak var carModelLabel: UILabel!

    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carModelLabel.text = carModel

        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        trafficLightView.setup()
        trafficLightView.start()
    }
    
    private func bind() {
        
    }
}
