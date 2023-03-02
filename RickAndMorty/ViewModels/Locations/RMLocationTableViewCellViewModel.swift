//
//  RMLocationTableViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Tiziano Cialfi on 02/03/23.
//

import Foundation

struct RMLocationTableViewCellViewModel: Hashable, Equatable {
    private let location: RMLocation
    
    init(location: RMLocation) {
        self.location = location
    }
    
    public var name: String {
        location.name
    }
    
    public var type: String {
        "Type: " + location.type
    }
    
    public var dimension: String {
        location.dimension
    }
    
    static func == (lhs: RMLocationTableViewCellViewModel, rhs: RMLocationTableViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(location.id)
        hasher.combine(dimension)
        hasher.combine(type)
    }
}
