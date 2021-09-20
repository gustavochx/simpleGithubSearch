//
//  SearchRepositoriesServiceImplementation.swift
//  SimpleGithubSearch
//
//  Created by Gustavo Henrique Frota Soares on 15/09/21.
//


final class SearchRepositoriesServiceImplementation: SearchRepositoriesService {

    let dataSource = NetworkDataSource()

    func searchRepositories(completionHandler: @escaping ((Result<Bool, NetworkErrors>) -> Void)) {
        completionHandler(.success(true))
    }
}
