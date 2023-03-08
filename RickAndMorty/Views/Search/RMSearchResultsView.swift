//
//  RMSearchResultsView.swift
//  RickAndMorty
//
//  Created by Tiziano Cialfi on 08/03/23.
//

import UIKit

/// Shows search results UI (table or collection as needed)
final class RMSearchResultsView: UIView {
    private var viewModel: RMSearchResultViewModel? {
        didSet {
            self.processViewModel()
        }
    }
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(
            RMLocationTableViewCell.self,
            forCellReuseIdentifier: RMLocationTableViewCell.cellIdentifier
        )
        tableView.isHidden = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(tableView)
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func processViewModel() {
        guard let viewModel = viewModel else {
            return
        }
        
        switch viewModel {
            case .characters(let viewModels):
                setUpCollectionView()
            case .locations(let viewModels):
                setUpTableView()
            case .episodes(let viewModels):
                setUpCollectionView()
        }
    }
    
    private func setUpCollectionView() {
        
    }
    
    private func setUpTableView() {
        tableView.isHidden = false
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        tableView.backgroundColor = .systemYellow
    }
    
    public func configure(with viewModel: RMSearchResultViewModel) {
        self.viewModel = viewModel
    }
}
