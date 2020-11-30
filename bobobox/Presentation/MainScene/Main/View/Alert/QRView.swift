//
//  QRView.swift
//  bobobox
//
//  Created by Fatah on 30/11/20.
//

import UIKit

class QRView: UIView {
    @IBOutlet weak var podNameLabel: UILabel!
    @IBOutlet weak var qrCodeImageView: UIImageView!
    
    @IBAction func resetButtonDidTap(_ sender: UIButton) {
        removeFromSuperview()
        closure()
    }
    
    var podName: String? {
        didSet {
            podNameLabel.text = podName
        }
    }
    var qrCode: String? {
        didSet {
            qrCodeImageView.image = generateQRCode(from: qrCode ?? "")
        }
    }
    
    var closure: () -> Void = {}
    
    // https://www.hackingwithswift.com/example-code/media/how-to-create-a-qr-code
    private func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }
    
}
