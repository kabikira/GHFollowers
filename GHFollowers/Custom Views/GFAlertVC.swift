//
//  GFAlertVC.swift
//  GHFollowers
//
//  Created by koala panda on 2024/05/02.
//

import UIKit
import SwiftUI

class GFAlertVC: UIViewController {

    let continerView = UIView()
    let titleLabel = GFTitleLabel(textAligment: .center, fontSize: 20)
    let messageLabel = GFBodyLabel(textAligment: .center)
    let actionButton = GFButton(backgroundColor: .systemPink, title: "Ok")

    var alertTitle: String?
    var message: String?
    var buttonTitle: String?

    let padding: CGFloat = 20


    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }


    func configureContainerView() {
        view.addSubview(continerView)
        continerView.backgroundColor = .systemBackground
        continerView.layer.cornerRadius = 16
        continerView.layer.borderWidth = 2
        continerView.layer.borderColor = UIColor.white.cgColor
        continerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            continerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            continerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continerView.widthAnchor.constraint(equalToConstant: 280),
            continerView.heightAnchor.constraint(equalToConstant: 220)
        ])

    }


    func configureTitleLabel() {
        continerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong"

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: continerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: continerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: continerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }


    func configureActionButton() {
        continerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)

        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: continerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: continerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: continerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }


    func configureMessageLabel() {
        continerView.addSubview(messageLabel)
        messageLabel.text = message ?? "Uneble to completo request"
        messageLabel .numberOfLines = 4

        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: continerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: continerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }


    @objc func dismissVC() {
        dismiss(animated: true)
    }

}

struct GFAlertVCPreview: PreviewProvider {
    struct Wrapper: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            return GFAlertVC(title: "タイトル", message: "Ivalid response from the server. Please try again.", buttonTitle: "OK")
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
    static var previews: some View {
        Wrapper()
    }
}
