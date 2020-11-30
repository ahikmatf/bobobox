//
//  BaseCell.swift
//  bobobox
//
//  Created by Fatah on 30/11/20.
//

import UIKit

class BaseCell: UICollectionViewCell {
    func getColor(for podStatus: String) -> UIColor {
        var color = UIColor.black
        switch podStatus {
        case "VC":
            color = .systemYellow
        case "VCI":
            color = .systemOrange
        case "OUD":
            color = .systemRed
        case "VD":
            color = .systemGray
        case "O": // occupied
            color = .systemGreen
        default:
            break
        }
        
        return color
    }
}
