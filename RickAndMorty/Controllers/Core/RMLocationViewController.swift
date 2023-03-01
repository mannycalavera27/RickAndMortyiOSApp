//
//  RMLocationViewController.swift
//  RickAndMorty
//
//  Created by Tiziano Cialfi on 22/02/23.
//

import UIKit

/// Controller to show and search for Locations
final class RMLocationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Locations"
        addSearchButton()
    }
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = .init(
            barButtonSystemItem: .search,
            target: self,
            action: #selector(didTapSeach)
        )
    }
    
    @objc
    private func didTapSeach() {
        
    }
}
