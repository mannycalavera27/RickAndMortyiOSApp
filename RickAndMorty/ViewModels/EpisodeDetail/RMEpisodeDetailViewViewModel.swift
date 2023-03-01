//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Tiziano Cialfi on 28/02/23.
//

import UIKit

protocol RMEpisodeDetailViewViewModelDelegate: AnyObject {
    func didFetchEpisodeDetails()
}

final class RMEpisodeDetailViewViewModel {
    private let endpointUrl: URL?
    private var dataTuple: (RMEpisode, [RMCharacter])? {
        didSet {
            delegate?.didFetchEpisodeDetails()
        }
    }
    
    enum SectionType {
        case information(viewModels: [RMEpisodeInfoCollectionViewCellViewModel])
        case characters(viewModel: RMCharacterCollectionViewCellViewModel)
    }
    
    public weak var delegate: RMEpisodeDetailViewViewModelDelegate?
    
    public private(set) var sections: [SectionType] = []
    
    // MARK: - Init
    
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
    }
    
    // MARK: - Public
    
    /// Fetch backing episode model
    public func fetchEpisodeData() {
        guard let url = endpointUrl,
              let request = RMRequest(url: url) else {
            return
        }
        RMService.shared.execute(
            request,
            expecting: RMEpisode.self) { [weak self] result in
                switch result {
                    case .success(let model):
                        print(String(describing: model))
                        self?.fetchReleatedCharacters(episode: model)
                    case .failure:
                        break
                }
            }
    }
    
    // MARK: - Private
    
    private func fetchReleatedCharacters(episode: RMEpisode) {
        let requests: [RMRequest] = episode.characters.compactMap {
            return URL(string: $0)
        }.compactMap {
            return RMRequest(url: $0)
        }
        
        // n of parallel requests
        // Notified once all done
        
        let group = DispatchGroup()
        var characters: [RMCharacter] = []
        for request in requests {
            group.enter()
            RMService.shared.execute(
                request,
                expecting: RMCharacter.self) { result in
                    defer {
                        group.leave()
                    }
                    switch result {
                        case .success(let model):
                            characters.append(model)
                        case .failure:
                            break
                    }
                }
        }
        
        group.notify(queue: .main) {
            self.dataTuple = (
                episode,
                characters
            )
        }
    }
}
