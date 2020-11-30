//
//  GridCellViewModel.swift
//  bobobox
//
//  Created by Fatah on 30/11/20.
//

import Foundation

struct GridCellViewModel {
    let podStatus: String
    let podCount: Int
}

extension GridCellViewModel {
    init(podSummary: PodSummary) {
        self.podStatus = podSummary.podStatus
        self.podCount = podSummary.podCount
    }
}
