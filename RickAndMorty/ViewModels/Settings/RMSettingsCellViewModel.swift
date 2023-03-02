//
//  RMSettingsCellViewViewModel.swift
//  RickAndMorty
//
//  Created by Tiziano Cialfi on 01/03/23.
//

import UIKit

struct RMSettingsCellViewModel: Identifiable {
    let id = UUID()
    
    public let type: RMSettingsOption
    public let onTapHanlder: (RMSettingsOption) -> Void
    
    // MARK: - Init
    
    init(type: RMSettingsOption, onTapHanlder: @escaping (RMSettingsOption) -> Void) {
        self.type = type
        self.onTapHanlder = onTapHanlder
    }
    
    // MARK: - Public
    
    public var image: UIImage? {
        return type.iconImage
    }
    
    public var title: String {
        return type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
}
