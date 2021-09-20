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
    let page: Int = 1

    init(searchRepositories: SearchRepositories) {
        self.searchRepositories = searchRepositories
    }

    func searchRepositories(query: String) {
        searchRepositories.searchRepositories(query: query, page: 1)
    }
}

extension SearchRepositoriesViewModel: SearchRepositoriesDisplayService {

    func didSearchedRepositories(value: Bool) {
        display?.didDisplay()
    }

    func errorOnSearchRepositories(error: String) {
        display?.errorOnDisplay()
    }
}
