//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Tiziano Cialfi on 02/03/23.
//

import Foundation

struct RMLocationViewViewModel {
    private var locations: [RMLocation] = []
    
    private var cellViewModels: [String] = []
    
    init() {
        
    }
    
    public func fetchLocations() {
        RMService.shared.execute(
            RMRequest.listLocationsRequest,
            expecting: String.self) { result in
                switch result {
                    case .success(let model):
                        break
                    case .failure(let failure):
                        break
                }
            }
    }
    
    public var hasMoreResults: Bool {
        false
    }
}
