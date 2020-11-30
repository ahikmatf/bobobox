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
    
    func fetchPodSummaryList() -> [PodSummary] {
        guard let podsList: PodListDTO = fileReader.fromJSON(named: "pod_list") else { return [] }
        let pods = podsList.toDomain()
        
        var podSummaryDict = [String: Int]()
        pods.forEach { (pod) in
            if let count = podSummaryDict[pod.roomStatusCode] {
                podSummaryDict[pod.roomStatusCode] = count + 1
            } else {
                podSummaryDict[pod.roomStatusCode] = 1
            }
        }
        
        var podSummaries = [PodSummary]()
        podSummaryDict.forEach { (key, value) in
            let podSummary = PodSummary(podStatus: key, podCount: value)
            podSummaries.append(podSummary)
        }
        
        return podSummaries
    }
}
