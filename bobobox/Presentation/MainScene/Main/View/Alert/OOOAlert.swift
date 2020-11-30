//
//  OOOAlert.swift
//  bobobox
//
//  Created by Fatah on 30/11/20.
//

import UIKit

class OOOAlert: UIView {

    @IBOutlet weak var alertContainer: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBAction func cancelDidTap(_ sender: UIButton) {
        removeFromSuperview()
    }
    
    @IBAction func continueDidTap(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.removeFromSuperview()
        }
    }
    
    func setupViews() {
        alertContainer.layer.cornerRadius = 8
        descriptionTextView.layer.cornerRadius = 8
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = UIColor.darkGray.cgColor
    }
}
