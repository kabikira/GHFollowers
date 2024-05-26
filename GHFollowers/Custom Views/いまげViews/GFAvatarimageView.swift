//
//  GFAvatarimageView.swift
//  GHFollowers
//
//  Created by koala panda on 2024/05/04.
//

import UIKit

class GFAvatarimageView: UIImageView {
    
    let cache           = NetworkManager.shared.cache
    let placehoderImage = Images.placeHolder

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds      = true
        image              = placehoderImage
        translatesAutoresizingMaskIntoConstraints = false
    }


    func downloadImage(formURL url: String) {
        Task { image = await NetworkManager.shared.downloadImage(from: url) ?? placehoderImage }
    }
}
