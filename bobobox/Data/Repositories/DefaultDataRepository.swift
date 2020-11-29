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
    func fetchHotelsList() {
        guard let hotelsList: [HotelDTO] = fileReader.fromJSON(named: "hotel_list") else { return }
        print(hotelsList.count)
    }
    
    func fetchPodsList() {
        guard let podsList: [HotelDTO] = fileReader.fromJSON(named: "pod_list") else { return }
        print(podsList.count)
    }
}
