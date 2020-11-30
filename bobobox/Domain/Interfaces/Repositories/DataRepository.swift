//
//  DataRepository.swift
//  bobobox
//
//  Created by Fatah on 29/11/20.
//

import Foundation

protocol DataRepository {
    func fetchHotelList() -> [Hotel]
    func fetchPodList() -> [Pod]
    func fetchPodSummaryList() -> [PodSummary]
}
