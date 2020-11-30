//
//  MainViewModel.swift
//  bobobox
//
//  Created by Fatah on 29/11/20.
//

import Foundation

enum PodStatus: String {
    case ALL
    case VD // vacant dirty
    case VC // vacant cleaned
    case VCI // vacant cleaned inspected
    case O // occupied
    case OOO // out of order
}

enum ViewType {
    case list
    case grid
}

protocol MainViewModel {
    func viewDidLoad()
    
    func getTotalDataCount(viewType: ViewType, filter: PodStatus) -> Int
    func getPod(for index: Int) -> Pod
    func getPodSummary(for index: Int) -> PodSummary
    
    func getPodFilterOptions() -> [Int: (key: String, value: String)]
}

class DefaultMainViewModel {
    private let useCase: DataUseCase
    
    private var hotelList = [Hotel]()
    private var podList = [Pod]()
    private var filteredPodList = [Pod]()
    private var podSummaryList = [PodSummary]()
    private var filteredPodSummaryList = [PodSummary]()
    
    init(useCase: DataUseCase) {
        self.useCase = useCase
    }
}

extension DefaultMainViewModel: MainViewModel {
    func viewDidLoad() {
        hotelList = useCase.getHotelList()
        podList = useCase.getPodList()
        podSummaryList = useCase.getPodSummaryList()
    }
    
    func getTotalDataCount(viewType: ViewType, filter: PodStatus) -> Int {
        if viewType == .list {
            var filterKey = ""
            switch filter {
            case .ALL:
                break
            case .VD:
                filterKey = "VD"
            case .VC:
                filterKey = "VC"
            case .VCI:
                filterKey = "VCI"
            case .O:
                filterKey = "OC"
            case .OOO:
                filterKey = "OUD"
            }
            
            if filterKey != "" {
                filteredPodList = podList.filter { $0.roomStatusCode == filterKey }
            } else {
                filteredPodList = podList
            }
            
            return filteredPodList.count
        } else if viewType == .grid {
            filteredPodSummaryList = podSummaryList
            
            return filteredPodSummaryList.count
        }
        
        return 0
    }
    
    func getPod(for index: Int) -> Pod {
        return filteredPodList[index]
    }
    
    func getPodSummary(for index: Int) -> PodSummary {
        return filteredPodSummaryList[index]
    }
    
    func getPodFilterOptions() -> [Int : (key: String, value: String)] {
        return [
            0: (key: "all", value: "All Status"),
            1: (key: "vd", value: "Vacant Dirty"),
            2: (key: "vc", value: "Vacant Cleaned"),
            3: (key: "vci", value: "Vacant Clean Inspected"),
            4: (key: "o", value: "Occupied"),
            5: (key: "ooo", value: "Out of Order")
        ]
    }
}
