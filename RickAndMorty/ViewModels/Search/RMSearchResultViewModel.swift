//
//  RMSearchResultViewModel.swift
//  RickAndMorty
//
//  Created by Tiziano Cialfi on 08/03/23.
//

import Foundation

enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
