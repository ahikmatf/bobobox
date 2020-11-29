//
//  ViewController.swift
//  bobobox
//
//  Created by Fatah on 28/11/20.
//

import UIKit

class ViewController: UIViewController {
    // property injection, temporal
    var useCase: DataUseCase?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        useCase?.getHotelList()
        useCase?.getPodList()
    }
}

