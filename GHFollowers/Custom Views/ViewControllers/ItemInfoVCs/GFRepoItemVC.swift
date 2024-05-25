//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by koala panda on 2024/05/12.
//

import UIKit

protocol GFRepoItemVCDelegate: AnyObject {
    func didTapGitHubProfile(for user: User)
}

class GFRepoItemVC: GFItemInfoVC {

    weak var delegate: GFRepoItemVCDelegate!

    
    init(user: User, delegate: GFRepoItemVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

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
