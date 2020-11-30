//
//  ListCell.swift
//  bobobox
//
//  Created by Fatah on 30/11/20.
//

import UIKit

class ListCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: ListCell.self)
    
    @IBOutlet weak var podNameLabel: UILabel!
    @IBOutlet weak var statusBackground: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    
    func fill(with viewModel: ListCellViewModel) {
        podNameLabel.text = viewModel.podName
        statusLabel.text = viewModel.podStatus
        
        setStatusBackground(status: viewModel.podStatus)
    }
    
    private func setStatusBackground(status: String) {
        var color = UIColor.white
        switch status {
        case "VC":
            color = .orange
        case "VCI":
            color = .green
        case "OUD":
            color = .red
        case "VD":
            color = .gray
        case "O": // occupied
            color = .blue
        default:
            break
        }
        
        statusBackground.backgroundColor = color
        statusBackground.layer.cornerRadius = statusBackground.frame.height / 2
    }
    
}
