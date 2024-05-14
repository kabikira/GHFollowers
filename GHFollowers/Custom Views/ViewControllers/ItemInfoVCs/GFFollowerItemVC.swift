//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by koala panda on 2024/05/12.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }


    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withConut: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withConut: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Follwers")
    }


    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
