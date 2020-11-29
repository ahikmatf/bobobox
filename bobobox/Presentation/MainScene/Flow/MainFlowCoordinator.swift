//
//  MainFlowCoordinator.swift
//  bobobox
//
//  Created by Fatah on 29/11/20.
//

import Foundation
import UIKit

protocol MainFlowCoordinatorDependencies {
    func makeLoginViewController() -> UIViewController
    func makeMainViewController() -> UIViewController
}

class MainFlowCoordinator {
    private let navigationController: UINavigationController
    private let dependencies: MainFlowCoordinatorDependencies
    
    init(navigationController: UINavigationController, dependencies: MainFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let vc = dependencies.makeMainViewController()
        navigationController.setViewControllers([vc], animated: false)
    }
}
