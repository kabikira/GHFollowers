//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by koala panda on 2024/05/23.
//

import UIKit

extension UITableView {

    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }


    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
