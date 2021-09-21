//
//  SearchRepositories.swift
//  SimpleGithubSearch
//
//  Created by Gustavo Henrique Frota Soares on 15/09/21.
//

import Foundation

struct SearchRepositorieParameters {
    var page: Int
    var query: String
    var count: Int
}

protocol SearchRepositoriesService {
    func searchRepositories(parameters: SearchRepositorieParameters,
                            completionHandler: @escaping((Result<GithubRepositorieResponse, NetworkErrors>) -> Void))
}

protocol SearchRepositoriesDisplayService: AnyObject {
    func didSearchedRepositories(value: [GithubRepositorie])
    func errorOnSearchRepositories(error: String)
}

class SearchRepositories {

    weak var display: SearchRepositoriesDisplayService?
    let service: SearchRepositoriesService

    init(service: SearchRepositoriesService) {
        self.service = service
    }

    func search(query: String, page: Int, count: Int) {

        let parameters = SearchRepositorieParameters(page: page,
                                                     query: query,
                                                     count: count)

        service.searchRepositories(parameters: parameters) { [weak self] result in
            switch result {
            case .success(let value):
                self?.display?.didSearchedRepositories(value: value.items ?? [])
            case .failure(let error):
                self?.display?.errorOnSearchRepositories(error: error.localizedDescription)
            }
        }
    }
}
