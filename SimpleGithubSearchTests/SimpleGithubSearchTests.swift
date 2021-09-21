//
//  SimpleGithubSearchTests.swift
//  SimpleGithubSearchTests
//
//  Created by Gustavo Henrique Frota Soares on 15/09/21.
//

import XCTest
@testable import SimpleGithubSearch

class SimpleGithubSearchTests: XCTestCase {

    internal class SearchRepositoriesMockService: SearchRepositoriesService {
        func searchRepositories(parameters: SearchRepositorieParameters, completionHandler: @escaping ((Result<[GithubRepositorie], NetworkErrors>) -> Void)) {
            completionHandler(.success([]))
        }
    }

    override class func setUp() {

    }

    func testExample() throws {
        let stubSearchRepositories = SearchRepositoriesMockService()
    }

    func testPerformanceExample() throws {
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
