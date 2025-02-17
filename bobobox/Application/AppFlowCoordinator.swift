//
//  AppFlowCoordinator.swift
//  bobobox
//
//  Created by Fatah on 29/11/20.
//

import Foundation
import UIKit

final class AppFlowCoordinator {
    private let navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        let mainSceneDIContainer = appDIContainer.makeMainSceneDIContainer()
        let flow = mainSceneDIContainer.makeMainFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}
