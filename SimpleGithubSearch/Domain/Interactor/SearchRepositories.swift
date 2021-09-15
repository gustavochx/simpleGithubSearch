//
//  SearchRepositories.swift
//  SimpleGithubSearch
//
//  Created by Gustavo Henrique Frota Soares on 15/09/21.
//

import Foundation

protocol SearchRepositoriesService {
    func searchRepositories(completionHandler: @escaping((Result<Bool, NetworkErrors>) -> Void))
}

protocol SearchRepositoriesDisplayService: AnyObject {
    func didSearchedRepositories(value: Bool)
    func errorOnSearchRepositories(error: String)
}

class SearchRepositories {

    weak var display: SearchRepositoriesDisplayService?
    let service: SearchRepositoriesService

    init(service: SearchRepositoriesService) {
        self.service = service
    }

    func searchRepositories(query: String, page: Int) {

        service.searchRepositories { [weak self] result in
            switch result {
            case .success(let value):
                self?.display?.didSearchedRepositories(value: value)
            case .failure(let error):
                self?.display?.errorOnSearchRepositories(error: error.localizedDescription)
            }
        }
        
    }
}
