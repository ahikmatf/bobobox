//
//  ActiveButton.swift
//  bobobox
//
//  Created by Fatah on 30/11/20.
//  https://stackoverflow.com/a/38411135/5552518

import UIKit

class ActiveButton: UIButton {
    private var _active = false
    var active: Bool {
        get {
            return _active
        }
        
        set {
            _active = newValue
            updateState()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }

    @objc func touchUpInside(sender: UIButton) {
        active = !active
    }

    private func updateState() {
        OperationQueue.main.addOperation {
            self.isHighlighted = self.active
        }
    }

}
