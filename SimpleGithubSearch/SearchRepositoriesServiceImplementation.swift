//
//  SearchRepositoriesServiceImplementation.swift
//  SimpleGithubSearch
//
//  Created by Gustavo Henrique Frota Soares on 15/09/21.
//


final class SearchRepositoriesServiceImplementation: SearchRepositoriesService {

    let dataSource = NetworkDataSource()

    func searchRepositories(parameters: SearchRepositorieParameters, completionHandler: @escaping ((Result<Bool, NetworkErrors>) -> Void)) {

        let url = GithubEndpoints.searchRepositories(items: parameters.count, page: parameters.page, query: parameters.query).path

        dataSource.request(url,
                           method: .get,
                           body: nil,
                           headers: nil,
                           responseObject: GithubRepositorieResponse.self) { response in

            switch response {
            case .success(let response):
                print(response)
                completionHandler(.success(true))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
     }
}
