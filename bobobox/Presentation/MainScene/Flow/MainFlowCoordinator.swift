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
    func makeMainViewController(userName: String) -> UIViewController
}

class MainFlowCoordinator {
    private let navigationController: UINavigationController
    private let dependencies: MainFlowCoordinatorDependencies
    
    init(navigationController: UINavigationController, dependencies: MainFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let actions = LoginViewModelActions(showMain: showMain(userName:))
        let vc = dependencies.makeLoginViewController(actions: actions)
        navigationController.setViewControllers([vc], animated: false)
    }
    
    private func showMain(userName: String) {
        let vc = dependencies.makeMainViewController(userName: userName)
        navigationController.setViewControllers([vc], animated: true)
    }
}
