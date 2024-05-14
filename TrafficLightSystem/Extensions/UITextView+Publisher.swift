//
//  UITextField+Publisher.swift
//  TrafficLightSystem
//
//  Created by Ivelin Tsankov on 13.05.24.
//

import UIKit
import Combine

extension UITextView {
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextView.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextView }
            .compactMap(\.text)
            .eraseToAnyPublisher()
    }
}
