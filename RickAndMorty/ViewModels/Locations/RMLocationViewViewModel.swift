//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Tiziano Cialfi on 02/03/23.
//

import Foundation

protocol RMLocationViewViewModelDelegate: AnyObject {
    func didFetchInitialLocations()
}

final class RMLocationViewViewModel {
    weak var delegate: RMLocationViewViewModelDelegate?
    
    private var locations: [RMLocation] = [] {
        didSet {
            for location in locations {
                let cellViewModel = RMLocationTableViewCellViewModel(location: location)
                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)
                }
            }
        }
    }
    
    private var apiInfo: RMGetAllLocationsResponse.Info?
    
    public private(set) var cellViewModels: [RMLocationTableViewCellViewModel] = []
    
    init() {
        
    }
    
    public func fetchLocations() {
        RMService.shared.execute(
            RMRequest.listLocationsRequest,
            expecting: RMGetAllLocationsResponse.self) { [weak self] result in
                switch result {
                    case .success(let model):
                        self?.apiInfo = model.info
                        self?.locations = model.results
                        DispatchQueue.main.async {
                            self?.delegate?.didFetchInitialLocations()
                        }
                    case .failure(let error):
                        break
                }
            }
    }
    
    public var hasMoreResults: Bool {
        false
    }
}