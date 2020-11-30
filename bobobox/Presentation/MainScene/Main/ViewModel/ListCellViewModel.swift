//
//  ListCellViewModel.swift
//  bobobox
//
//  Created by Fatah on 30/11/20.
//

import Foundation

struct ListCellViewModel {
    let podName: String
    let podStatus: String
}

extension ListCellViewModel {
    init(pod: Pod) {
        self.podName = pod.roomName
        self.podStatus = pod.roomStatusCode
    }
}
