//
//  DefaultDataRepository.swift
//  bobobox
//
//  Created by Fatah on 29/11/20.
//

import Foundation

final class DefaultDataRepository {
    private let fileReader: FileReader
    
    init(fileReader: FileReader = FileReader.instance) {
        self.fileReader = fileReader
    }
}

extension DefaultDataRepository: DataRepository {
    func fetchHotelList() -> [Hotel] {
        guard let hotelsList: HotelListDTO = fileReader.fromJSON(named: "hotel_list") else { return [] }
        return hotelsList.toDomain()
    }
    
    func fetchPodList() -> [Pod] {
        guard let podsList: PodListDTO = fileReader.fromJSON(named: "pod_list") else { return [] }
        return podsList.toDomain()
    }
}
