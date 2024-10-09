//
//  Feedback.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/9/24.
//

import UIKit

extension UIViewController {
    func showNetworkAlert() {
        let alert = UIAlertController(title: "Network Issue",
                                      message: "Your network connection is unstable, which may affect video playback.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
