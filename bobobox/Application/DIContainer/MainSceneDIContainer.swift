//
//  MainSceneDIContainer.swift
//  bobobox
//
//  Created by Fatah on 29/11/20.
//

import Foundation
import UIKit

final class MainSceneDIContainer: MainFlowCoordinatorDependencies {
    func makeDataRepository() -> DataRepository {
        return DefaultDataRepository()
    }
    
    func makeDataUseCase() -> DataUseCase {
        return DefaultDataUseCase(repository: makeDataRepository())
    }
    
    func makeLoginViewController() -> UIViewController {
        return ViewController()
    }

    func makeMainViewController() -> UIViewController {
        let vc = ViewController()
        vc.view.backgroundColor = .cyan
        vc.useCase = makeDataUseCase()
        
        return vc
    }
    
    func makeMainFlowCoordinator(navigationController: UINavigationController) -> MainFlowCoordinator {
        return MainFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
}
