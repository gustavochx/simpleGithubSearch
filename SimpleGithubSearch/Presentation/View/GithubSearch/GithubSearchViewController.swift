//
//  GithubSearchViewController.swift
//  SimpleGithubSearch
//
//  Created by Gustavo Henrique Frota Soares on 20/09/21.
//

import UIKit

class GithubSearchViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    // MARK: - Variables
    private let viewModel: SearchRepositoriesViewModel
    var activityIndicatorView = UIActivityIndicatorView()
    var overlayView = UIView()

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
        searchBar.delegate = self
        configureTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startLoading(with: view, overlayView: overlayView, activityView: activityIndicatorView)
        viewModel.searchRepositories(query: "swift")
    }

    // MARK: - Main Functions -
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "GithubSearchTableViewCell", bundle: nil), forCellReuseIdentifier: "GithubSearchTableViewCell")
    }
}

extension GithubSearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let query = searchBar.text
        viewModel.stopPagination()
        viewModel.searchRepositories(query: query ?? "swift")
    }
}

extension GithubSearchViewController: SearchRepositoriesDisplay {

    func didDisplay() {
        stopLoading(overlayView: overlayView, activityView: activityIndicatorView)
        tableView.reloadData()
    }

    func errorOnDisplay() {
        stopLoading(overlayView: overlayView, activityView: activityIndicatorView)
    }
}

extension GithubSearchViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        present(GithubSearchFactory.makeDetail(searchViewModel: viewModel), animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == tableView.numberOfRows(inSection: 0) - 1 {
            startLoading(with: view, overlayView: overlayView, activityView: activityIndicatorView)
            viewModel.increasePage()
            viewModel.enablePagination()
            viewModel.searchRepositories(query: "swift")
        }
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

