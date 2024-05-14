//
//  TrafficLightView.swift
//  TrafficLightSystem
//
//  Created by Ivelin Tsankov on 14.05.24.
//

import UIKit

enum TrafficLight {
    case red
    case yellow
    case green
    
    func time() -> Int {
        switch (self) {
        case .red, .green:
            return 4
        case .yellow:
            return 1
        }
    }
    
    func nextTrafficLight() -> TrafficLight {
        switch (self) {
        case .red:
            return .yellow
        case .yellow:
            return .green
        case .green:
            return .red
        }
    }
}

struct Alpha {
    static let current = 1.0
    static let fade = 0.3
    static let animationDuration = 0.3
}

class TrafficLightView: UIView {
    var currentTrafficLight: TrafficLight = .red
    
    var timer: Timer?

    @IBOutlet weak var red: UIView!
    @IBOutlet weak var yellow: UIView!
    @IBOutlet weak var green: UIView!
    
    func start() {
        currentTrafficLight = .red
        changeAlphas(forTrafficLight: currentTrafficLight)
        setTimer(seconds: currentTrafficLight.time())
    }
    
    func setup() {
        //Circle views
        red.layer.cornerRadius = red.frame.size.width / 2
        yellow.layer.cornerRadius = yellow.frame.size.width / 2
        green.layer.cornerRadius = green.frame.size.width / 2
                
        red.alpha = Alpha.fade
        yellow.alpha = Alpha.fade
        green.alpha = Alpha.fade
    }
    
    func setTimer(seconds: Int) {
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(seconds), target: self, selector: #selector(timerFired), userInfo: nil, repeats: false)
    }
    
    @objc func timerFired() {
        let nextTrafficLight = currentTrafficLight.nextTrafficLight()
        
        changeAlphas(forTrafficLight: nextTrafficLight)
        
        setTimer(seconds: nextTrafficLight.time())
        currentTrafficLight = nextTrafficLight
    }
    
    func changeAlphas(forTrafficLight trafficLight: TrafficLight) {
        UIView.animate(withDuration: Alpha.animationDuration, animations: { [weak self] in
            self?.red.alpha = Alpha.fade
            self?.yellow.alpha = Alpha.fade
            self?.green.alpha = Alpha.fade
            
            switch trafficLight {
            case .red:
                self?.red.alpha = Alpha.current
                break
            case .yellow:
                self?.yellow.alpha = Alpha.current
                break
            case .green:
                self?.green.alpha = Alpha.current
                break
            }
        })
    }
}
