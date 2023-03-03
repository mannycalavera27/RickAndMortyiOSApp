//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Tiziano Cialfi on 22/02/23.
//

import UIKit

/// Controller to show and search for Characters
final class RMCharacterViewController: UIViewController, RMCharacterListViewDelegate {
    private let characterListView = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        setUpView()
        addSearchButton()
    }
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = .init(
            barButtonSystemItem: .search,
            target: self,
            action: #selector(didTapSearch)
        )
    }
    
    @objc
    private func didTapSearch() {
        let vc = RMSearchViewController(config: .init(type: .character))
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setUpView() {
        characterListView.delegate = self
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            characterListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    // MARK: - RMCharacterListViewDelegate
    
    func rmCharacterListView(_ characterListView: RMCharacterListView, didSelectCharacter character: RMCharacter) {
        // Open detail controller for that character
        let viewModel = RMCharacterDetailViewViewModel(character: character)
        let detailVC = RMCharacterDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
