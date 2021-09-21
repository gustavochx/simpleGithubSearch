//
//  GithubRepositorie.swift
//  SimpleGithubSearch
//
//  Created by Gustavo Henrique Frota Soares on 20/09/21.
//

import Foundation

/*
 {

 created_at: "2015-10-23T21:15:07Z",
 updated_at: "2021-09-15T17:51:41Z",
 pushed_at: "2021-09-15T17:23:32Z",
 git_url: "git://github.com/apple/swift.git",
 ssh_url: "git@github.com:apple/swift.git",
 clone_url: "https://github.com/apple/swift.git",
 svn_url: "https://github.com/apple/swift",
 homepage: "https://swift.org",
 size: 715975,
 stargazers_count: 57250,
 watchers_count: 57250,
 language: "C++",
 has_issues: false,
 has_projects: false,
 has_downloads: true,
 has_wiki: false,
 has_pages: false,
 forks_count: 9187,
 mirror_url: null,
 archived: false,
 disabled: false,
 open_issues_count: 437,
 allow_forking: true,
 forks: 9187,
 open_issues: 437,
 watchers: 57250,
 default_branch: "main",
 score: 1
 },
 */

struct GithubOwnerRepositorie: Decodable {

    let login: String?
    let id: Int?
    let nodeId: String?
    let avatarUrl: String?
    let url: String?
    let htmlUrl: String?
    let type: String?
    let siteAdmin: Bool?

    enum CodingKeys: String, CodingKey {
        case login
        case id
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
        case url
        case htmlUrl = "html_url"
        case type
        case siteAdmin = "site_admin"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.login = try container.decodeIfPresent(String.self, forKey: .login)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.nodeId = try container.decodeIfPresent(String.self, forKey: .nodeId)
        self.avatarUrl = try container.decodeIfPresent(String.self, forKey: .avatarUrl)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.htmlUrl = try container.decodeIfPresent(String.self, forKey: .htmlUrl)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.siteAdmin = try container.decodeIfPresent(Bool.self, forKey: .siteAdmin)
    }
}

struct GithubLicenseRepositorie: Decodable {

    let key: String?
    let name: String?
    let spdxId: String?
    let url: String?
    let nodeId: String?

    enum CodingKeys: String, CodingKey {
        case key
        case name
        case spdxId = "spdxId"
        case url
        case nodeId = "node_id"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try container.decodeIfPresent(String.self, forKey: .key)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.spdxId = try container.decodeIfPresent(String.self, forKey: .spdxId)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.nodeId = try container.decodeIfPresent(String.self, forKey: .nodeId)
    }
}


struct GithubRepositorie: Decodable {

    let id: Int?
    let nodeId: String?
    let name: String?
    let fullName: String?
    let privateRepository: Bool?
    let htmlUrl: String?
    let description: String?
    let fork: Bool?
    let owner: GithubOwnerRepositorie?
    let license: GithubLicenseRepositorie?


    enum CodingKeys: String, CodingKey {
        case id
        case nodeId = "node_id"
        case name
        case fullName = "full_name"
        case privateRepository = "private"
        case htmlUrl = "html_url"
        case description
        case fork
        case owner
        case license
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.nodeId = try container.decodeIfPresent(String.self, forKey: .nodeId)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.fullName = try container.decodeIfPresent(String.self, forKey: .fullName)
        self.privateRepository = try container.decodeIfPresent(Bool.self, forKey: .privateRepository)
        self.htmlUrl = try container.decodeIfPresent(String.self, forKey: .htmlUrl)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.fork = try container.decodeIfPresent(Bool.self, forKey: .fork)
        self.owner = try container.decodeIfPresent(GithubOwnerRepositorie.self, forKey: .owner)
        self.license = try container.decodeIfPresent(GithubLicenseRepositorie.self, forKey: .license)
    }
}
