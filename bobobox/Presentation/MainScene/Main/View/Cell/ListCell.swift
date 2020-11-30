//
//  ListCell.swift
//  bobobox
//
//  Created by Fatah on 30/11/20.
//

import UIKit

class ListCell: BaseCell {
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
        statusBackground.backgroundColor = getColor(for: status)
        statusBackground.layer.cornerRadius = statusBackground.frame.height / 2
    }
    
}
