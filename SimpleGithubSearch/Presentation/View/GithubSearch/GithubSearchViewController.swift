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

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

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
        viewModel.display = self
        configureTableView()
    }

    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "GithubSearchTableViewCell", bundle: nil), forCellReuseIdentifier: "GithubSearchTableViewCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.searchRepositories(query: "")
    }
}

extension GithubSearchViewController: SearchRepositoriesDisplay {

    func didDisplay() {
        tableView.reloadData()
    }

    func errorOnDisplay() {

    }
}

extension GithubSearchViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        present(GithubSearchFactory.makeDetail(searchViewModel: viewModel), animated: true, completion: nil)
    }

}

extension GithubSearchViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "GithubSearchTableViewCell", for: indexPath) as! GithubSearchTableViewCell

        cell.configure(with: viewModel.repositories[indexPath.row])
        return cell
    }
}

