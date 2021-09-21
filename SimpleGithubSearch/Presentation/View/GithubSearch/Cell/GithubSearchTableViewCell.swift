//
//  GithubSearchTableViewCell.swift
//  SimpleGithubSearch
//
//  Created by Gustavo Henrique Frota Soares on 20/09/21.
//

import UIKit

final class GithubSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var repositorieTitleLabel: UILabel!
    @IBOutlet weak var repositorieDescriptionLabel: UILabel!
    @IBOutlet weak var repositorieUrlLabel: UILabel!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with repositorie: GithubRepositorie) {
        self.repositorieTitleLabel.text = repositorie.name
        self.repositorieDescriptionLabel.text = repositorie.description
        self.repositorieUrlLabel.text = repositorie.htmlUrl
    }
}
