//
//  Alertable.swift
//  bobobox
//
//  Created by Oleh Kudinov on 01.10.18.
//

import UIKit

protocol Alertable {}
extension Alertable where Self: UIViewController {
    func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: completion)
    }
}
