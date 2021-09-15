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

    let searchRepositories = SearchRepositories(service: SearchRepositoriesServiceImplementation())
    let page: Int = 1
    weak var display: SearchRepositoriesDisplay?

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
