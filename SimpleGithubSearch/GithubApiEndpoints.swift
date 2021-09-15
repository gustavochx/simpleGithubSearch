//
//  GithubApiEndpoints.swift
//  SimpleGithubSearch
//
//  Created by Gustavo Henrique Frota Soares on 15/09/21.
//

import Foundation

fileprivate enum GithubApiEnv: String {
    case production = "https://api.github.com/"
}

enum GithubEndpoints {

    fileprivate var environment: GithubApiEnv { .production }
    case searchRepositories(items: Int, page: Int, query: String)

    var path: String {
        switch self {
        case .searchRepositories(let items,
                                 let page,
                                 let query):
            return String(describing: environment.rawValue
                            + "search/repositories?q="
                            + query
                            + "per_page=\(items)&page=\(page)")
        }
    }
}
