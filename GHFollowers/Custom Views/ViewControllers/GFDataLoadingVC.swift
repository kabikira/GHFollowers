//
//  GFDataLoadingVC.swift
//  GHFollowers
//
//  Created by koala panda on 2024/05/21.
//

import UIKit

class GFDataLoadingVC: UIViewController {

    var containerView: UIView!

    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)

        containerView.backgroundColor = .systemBackground
        containerView.alpha           = 0

        UIView.animate(withDuration: 0.25) { self.containerView.alpha = 0.8 }

        let activityIndicator          = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        activityIndicator.startAnimating()
    }


    func dismissLoadingView() {
        DispatchQueue.main.async {
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
    }


    func showEmptyStateView(with messeage: String, in view: UIView) {
        let emptyStateView = GFEmptyStateView(message: messeage)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
}
