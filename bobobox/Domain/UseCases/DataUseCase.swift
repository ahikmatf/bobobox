//
//  DataUseCase.swift
//  bobobox
//
//  Created by Fatah on 29/11/20.
//

import Foundation

protocol DataUseCase {
    func gethHotelsList()
    func getPodsList()
}

final class DefaultDataUseCase {
    let repository: DataRepository
    
    init(repository: DataRepository) {
        self.repository = repository
    }
}

extension DefaultDataUseCase: DataUseCase {
    func gethHotelsList() {
        repository.fetchHotelsList()
    }
    
    func getPodsList() {
        repository.fetchPodsList()
    }
}
