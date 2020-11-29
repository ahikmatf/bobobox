//
//  LoginViewModel.swift
//  bobobox
//
//  Created by Fatah on 29/11/20.
//

import Foundation

struct LoginViewModelActions {
    let showMain: (String) -> Void
}

protocol LoginViewModel {
    func verifyLogin(email: String, password: String, completion: @escaping () -> Void)
}

class DefaultLoginViewModel: LoginViewModel {
    let useCase: DataUseCase
    let actions: LoginViewModelActions
    
    init(useCase: DataUseCase, actions: LoginViewModelActions) {
        self.useCase = useCase
        self.actions = actions
    }
    
    func verifyLogin(email: String, password: String, completion: @escaping () -> Void) {
        if email != "" && password != "" {
            actions.showMain(email)
        } else {
            completion()
        }
    }
}
