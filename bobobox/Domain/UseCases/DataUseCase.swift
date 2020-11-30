//
//  DataUseCase.swift
//  bobobox
//
//  Created by Fatah on 29/11/20.
//

import Foundation

protocol DataUseCase {
    func getHotelList() -> [Hotel]
    func getPodList() -> [Pod]
    func getPodSummaryList() -> [PodSummary]
}

final class DefaultDataUseCase {
    let repository: DataRepository
    
    init(repository: DataRepository) {
        self.repository = repository
    }
}

extension DefaultDataUseCase: DataUseCase {
    func getHotelList() -> [Hotel] {
        return repository.fetchHotelList()
    }
    
    func getPodList() -> [Pod] {
        return repository.fetchPodList()
    }
    
    func getPodSummaryList() -> [PodSummary] {
        return repository.fetchPodSummaryList()
    }
}
