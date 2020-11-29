//
//  MainViewModel.swift
//  bobobox
//
//  Created by Fatah on 29/11/20.
//

import Foundation

protocol MainViewModel {
    func viewDidLoad()
}

class DefaultMainViewModel: MainViewModel {
    private let useCase: DataUseCase
    
    private var hotelList = [Hotel]()
    private var podList = [Pod]()
    
    init(useCase: DataUseCase) {
        self.useCase = useCase
    }
    
    func viewDidLoad() {
        hotelList = useCase.getHotelList()
        podList = useCase.getPodList()
    }
}
