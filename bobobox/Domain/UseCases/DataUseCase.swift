//
//  DataUseCase.swift
//  bobobox
//
//  Created by Fatah on 29/11/20.
//

import Foundation

protocol DataUseCase {
    func getHotelList()
    func getPodList()
}

final class DefaultDataUseCase {
    let repository: DataRepository
    
    init(repository: DataRepository) {
        self.repository = repository
    }
}

extension DefaultDataUseCase: DataUseCase {
    func getHotelList() {
        repository.fetchHotelList()
    }
    
    func getPodList() {
        repository.fetchPodList()
    }
}
