//
//  GithubSearchViewController.swift
//  SimpleGithubSearch
//
//  Created by Gustavo Henrique Frota Soares on 20/09/21.
//

import UIKit

class GithubSearchViewController: UIViewController {

    // MARK: - Variables
    private let viewModel: SearchRepositoriesViewModel

    // MARK: - Life Cycle
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: SearchRepositoriesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension GithubSearchViewController: UITableViewDelegate {

}

extension GithubSearchViewController: UITableViewDataSource {

}
