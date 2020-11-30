//
//  GridCell.swift
//  bobobox
//
//  Created by Fatah on 30/11/20.
//

import UIKit

class GridCell: BaseCell {
    static let reuseIdentifier = String(describing: GridCell.self)
    
    @IBOutlet weak var dotImage: UIImageView!
    @IBOutlet weak var podStatus: UILabel!
    @IBOutlet weak var podCount: UILabel!

    func fill(with viewModel: GridCellViewModel) {
        dotImage.tintColor = getColor(for: viewModel.podStatus)
        podStatus.textColor = getColor(for: viewModel.podStatus)
        podStatus.text = viewModel.podStatus
        podCount.text = "\(viewModel.podCount)"
    }

}
