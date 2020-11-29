//
//  MainFlowCoordinator.swift
//  bobobox
//
//  Created by Fatah on 29/11/20.
//

import Foundation
import UIKit

protocol MainFlowCoordinatorDependencies {
    func makeLoginViewController(actions: LoginViewModelActions) -> UIViewController 
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
        let actions = LoginViewModelActions(showMain: showMain(email:))
        let vc = dependencies.makeLoginViewController(actions: actions)
        navigationController.setViewControllers([vc], animated: false)
    }
    
    private func showMain(email: String) {
        let vc = ViewController()
        navigationController.setViewControllers([vc], animated: true)
    }
}
