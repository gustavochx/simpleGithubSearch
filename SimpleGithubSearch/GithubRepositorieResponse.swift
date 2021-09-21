//
//  GithubRepositorieResponse.swift
//  SimpleGithubSearch
//
//  Created by Gustavo Henrique Frota Soares on 20/09/21.
//

import Foundation

struct GithubRepositorieResponse: Decodable {

    var totalCount: Int?
    var incompleteResults: Bool?
    var items: [GithubRepositorie]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalCount = try container.decodeIfPresent(Int.self, forKey: .totalCount)
        self.incompleteResults = try container.decodeIfPresent(Bool.self, forKey: .incompleteResults)
        self.items = try container.decodeIfPresent([GithubRepositorie].self, forKey: .items)
    }
}
