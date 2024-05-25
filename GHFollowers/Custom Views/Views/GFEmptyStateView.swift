//
//  GFEmptyStateView.swift
//  GHFollowers
//
//  Created by koala panda on 2024/05/06.
//

import UIKit

class GFEmptyStateView: UIView {

    let messageLabel  = GFTitleLabel(textAligment: .center, fontSize: 28)
    let logoImageView = UIImageView()

    // プログラムによる初期化のためのイニシャライザ
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }


    // インターフェースビルダーからの初期化のためのイニシャライザ
    // 必須イニシャライザのため、サブクラス全てで実装が必要
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
    }


    private func configure() {
        addSubviews(messageLabel, logoImageView)
        configureMessageLabel()
        configureLogoImageView()
    }


    private func configureMessageLabel() {
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel

        let labelCenterYConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? -80 : -150

        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: labelCenterYConstant),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
        ])
    }


    private func configureLogoImageView() {
        logoImageView.image = Images.emptyState
        logoImageView.translatesAutoresizingMaskIntoConstraints = false

        let logoBottomConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 80 : 40

        NSLayoutConstraint.activate([
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: logoBottomConstant),
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40)
        ])
    }
}
