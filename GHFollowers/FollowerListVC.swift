//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by koala panda on 2024/05/01.
//

import UIKit

class FollowerListVC: UIViewController {

    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true

    }

}
