//
//  RMSearchInputViewViewModel.swift
//  RickAndMorty
//
//  Created by Tiziano Cialfi on 03/03/23.
//

import Foundation

final class RMSearchInputViewViewModel {
    private let type: RMSearchViewController.Config.`Type`
    
    enum DynamicOption: String {
        case status = "Status"
        case gender = "Gender"
        case locationType = "Location Type"
        
        var choices: [String] {
            switch self {
                case .status:
                    return ["alive", "dead", "unknown"]
                case .gender:
                    return ["female", "male", "genderless", "unknown"]
                case .locationType:
                    return ["cluster", "planet", "microverse"]
            }
        }
    }
    
    init(type: RMSearchViewController.Config.`Type`) {
        self.type = type
    }
    
    // MARK: - Public
    
    public var hasDynamicOptions: Bool {
        switch type {
            case .character, .location:
                return true
            case .episode:
                return false
        }
    }
    
    public var options: [DynamicOption] {
        switch type {
            case .character:
                return [.status, .gender]
            case .episode:
                return []
            case .location:
                return [.locationType]
        }
    }
    
    public var searchPlaceholderText: String {
        switch type {
            case .character:
                return "Character Name"
            case .episode:
                return "Episode Title"
            case .location:
                return "Location Name"
        }
    }
}
