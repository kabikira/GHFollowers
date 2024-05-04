//
//  GFAvatarimageView.swift
//  GHFollowers
//
//  Created by koala panda on 2024/05/04.
//

import UIKit

class GFAvatarimageView: UIImageView {
    
    let placehoderImage = UIImage(named: "avatar-placeholder")

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placehoderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
