//
//  FavoritesListVC.swift
//  GHFollowers
//
//  Created by koala panda on 2024/04/29.
//

import UIKit

class FavoritesListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue

        PresistenceManager.retrieveFavoretes { result in
            switch result {
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                break
            }
        }
    }


}
