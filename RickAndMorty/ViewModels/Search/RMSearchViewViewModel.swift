//
//  RMSearchViewViewModel.swift
//  RickAndMorty
//
//  Created by Tiziano Cialfi on 03/03/23.
//

import Foundation

final class RMSearchViewViewModel {
    let config: RMSearchViewController.Config
    private var optionMap: [RMSearchInputViewViewModel.DynamicOption: String] = [:]
    private var searchText = ""
    
    private var optionMapUpdateBlock: (((RMSearchInputViewViewModel.DynamicOption, String)) -> Void)?
    
    private var searchResultHandler: (() -> Void)?
    
    // MARK: - Init
    
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
    
    // MARK: - Public
    
    public func registerSearchResultHandler(_ block: @escaping () -> Void) {
        self.searchResultHandler = block
    }
    
    public func executeSearch() {
        print("Search text: \(searchText)")
        
        var queryParams: [URLQueryItem] = [
            URLQueryItem(
                name: "name",
                value: searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            )
        ]
        
        queryParams.append(contentsOf: optionMap.enumerated().compactMap{ _, element in
            let key: RMSearchInputViewViewModel.DynamicOption  = element.key
            let value: String = element.value
            return URLQueryItem(name: key.queryArgument, value: value)
        })
        
        let request = RMRequest(
            endpoint: config.type.endpoint,
            queryParameters: queryParams
        )
        
        print(String(describing: request.url?.absoluteString))
        
        RMService.shared.execute(request, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
                case .success(let model):
                    print("Search results found: \(model.results.count)")
                case .failure:
                    break
            }
        }
    }
    
    public func set(query text: String) {
        searchText = text
    }
    
    public func set(value : String, for option: RMSearchInputViewViewModel.DynamicOption) {
        optionMap[option] = value
        let tuple = (option, value)
        optionMapUpdateBlock?(tuple)
    }
    
    public func registerOptionChangeBlock(
        _ block: @escaping ((RMSearchInputViewViewModel.DynamicOption, String)) -> Void
    ) {
        optionMapUpdateBlock = block
    }
}
