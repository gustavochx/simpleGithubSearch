//
//  DetailGithubRepositorieViewController.swift
//  SimpleGithubSearch
//
//  Created by Gustavo Henrique Frota Soares on 20/09/21.
//

import UIKit

class DetailGithubRepositorieViewController: UIViewController {

    //MARK: - Variables -
    private let viewModel: SearchRepositoriesViewModel

    @IBOutlet weak var backButton: UIButton!

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

    //MARK: - View Actions -
    @IBAction func onPressBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
