//
//  RMLocationDetailViewController.swift
//  RickAndMorty
//
//  Created by Tiziano Cialfi on 03/03/23.
//

import UIKit

class RMLocationDetailViewController: UIViewController, RMLocationDetailViewViewModelDelegate, RMLocationDetailViewDelegate {
    private let viewModel: RMLocationDetailViewViewModel
    
    private let detailView = RMLocationDetailView()
    
    // MARK: - Init
    
    init(location: RMLocation) {
        let url = URL(string: location.url)
        self.viewModel = .init(endpointUrl: url)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        detailView.delegate = self
        addConstraints()
        title = "Location"
        navigationItem.rightBarButtonItem = .init(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(didTapShare)
        )
        viewModel.delegate = self
        viewModel.fetchLocationData()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc
    private func didTapShare() {
        
    }
    
    // MARK: - View Delegate
    func rmLocationDetailView(_ detailView: RMLocationDetailView, didSelect character: RMCharacter) {
        let vc = RMCharacterDetailViewController(viewModel: .init(character: character))
        vc.title = character.name
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - ViewModel Delegate
    func didFetchLocationDetails() {
        detailView.configure(with: viewModel)
    }
}
