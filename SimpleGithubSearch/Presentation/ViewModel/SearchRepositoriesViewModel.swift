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
    var page: Int = 1
    var isPaginating: Bool = false
    let count: Int = 10


    init(searchRepositories: SearchRepositories) {
        self.searchRepositories = searchRepositories
        self.searchRepositories.display = self
    }

    func searchRepositories(query: String) {
        searchRepositories.search(query: query, page: page, count: count)
    }

    func increasePage() {
        page += 1
    }

    func enablePagination() {
        isPaginating = true
    }

    func stopPagination() {
        isPaginating = false
    }
}

extension SearchRepositoriesViewModel: SearchRepositoriesDisplayService {

    func didSearchedRepositories(value: [GithubRepositorie]) {

        if isPaginating {
            repositories += value
        } else {
            repositories = value
        }

        display?.didDisplay()
    }

    func errorOnSearchRepositories(error: String) {
        display?.errorOnDisplay()
    }
}
