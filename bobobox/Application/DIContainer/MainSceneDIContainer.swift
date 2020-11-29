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
    
    func makeLoginViewModel(actions: LoginViewModelActions) -> LoginViewModel {
        return DefaultLoginViewModel(actions: actions)
    }
    
    func makeLoginViewController(actions: LoginViewModelActions) -> UIViewController {
        let viewModel = makeLoginViewModel(actions: actions)
        return LoginViewController(viewModel: viewModel)
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
