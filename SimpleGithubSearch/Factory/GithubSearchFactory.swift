//
//  GithubSearchFactory.swift
//  SimpleGithubSearch
//
//  Created by Gustavo Henrique Frota Soares on 20/09/21.
//


final class GithubSearchFactory {

    static func make() -> GithubSearchViewController {
        let searchRepositories = SearchRepositories(service: SearchRepositoriesServiceImplementation())
        let searchRepositoriesViewModel = SearchRepositoriesViewModel(searchRepositories: searchRepositories)
        return GithubSearchViewController(viewModel: searchRepositoriesViewModel)
    }

}
