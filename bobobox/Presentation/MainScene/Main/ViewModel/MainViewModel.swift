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
}

class DefaultMainViewModel {
    private let useCase: DataUseCase
    
    private var hotelList = [Hotel]()
    private var podList = [Pod]()
    private var filteredPodList = [Pod]()
    
    init(useCase: DataUseCase) {
        self.useCase = useCase
    }
}

extension DefaultMainViewModel: MainViewModel {
    func viewDidLoad() {
        hotelList = useCase.getHotelList()
        podList = useCase.getPodList()
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
        } else if viewType == .grid {
            // TODO: handle grid
            filteredPodList = podList
        }
        
        return filteredPodList.count
    }
    
    func getPod(for index: Int) -> Pod {
        return filteredPodList[index]
    }
}
