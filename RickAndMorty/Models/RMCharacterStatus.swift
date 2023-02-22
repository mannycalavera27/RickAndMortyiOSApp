//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Tiziano Cialfi on 22/02/23.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}
