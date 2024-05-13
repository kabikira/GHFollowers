//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by koala panda on 2024/05/12.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }


    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withConut: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withConut: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }


    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}
