//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by koala panda on 2024/05/22.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
