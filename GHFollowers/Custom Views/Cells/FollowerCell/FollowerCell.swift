//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by koala panda on 2024/05/04.
//

import UIKit
import SwiftUI

class FollowerCell: UICollectionViewCell {

    static let reuseID  = "FollwerCell" // viewコントローラーから呼び出すのでstatic let

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func set(follower: Follower) {
        contentConfiguration = UIHostingConfiguration { FollowerView(follower: follower) }
    }
}
