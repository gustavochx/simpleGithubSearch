//
//  SearchRepositoriesViewModel.swift
//  SimpleGithubSearch
//
//  Created by Gustavo Henrique Frota Soares on 15/09/21.
//

import Foundation

protocol SearchRepositoriesDisplay: AnyObject {
    func didDisplay()
    func errorOnDisplay()
}

class SearchRepositoriesViewModel {

    weak var display: SearchRepositoriesDisplay?
    
    private let searchRepositories: SearchRepositories
    var repositories: [GithubRepositorie] = []

    let page: Int = 1
    let count: Int = 10

    init(searchRepositories: SearchRepositories) {
        self.searchRepositories = searchRepositories
        self.searchRepositories.display = self
    }

    func searchRepositories(query: String) {
        searchRepositories.search(query: query, page: page, count: count)
    }
}

extension SearchRepositoriesViewModel: SearchRepositoriesDisplayService {

    func didSearchedRepositories(value: [GithubRepositorie]) {
        repositories = value
        display?.didDisplay()
    }

    func errorOnSearchRepositories(error: String) {
        display?.errorOnDisplay()
    }
}
