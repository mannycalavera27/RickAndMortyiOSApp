//
//  RMSearchView.swift
//  RickAndMorty
//
//  Created by Tiziano Cialfi on 03/03/23.
//

import UIKit

final class RMSearchView: UIView {
    private let viewModel: RMSearchViewViewModel
    
    // MARK: - Subivews
    
    // MARK: - Init
    
    init(frame: CGRect, viewModel: RMSearchViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        backgroundColor = .red
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

// MARK: - CollectionView

extension RMSearchView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
