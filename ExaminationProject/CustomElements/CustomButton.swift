//
//  CustomButton.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 11.10.2024.
//

import UIKit

protocol ICustomButtonDelegate {
	func pressedButton (_ button: UIButton)
}

class CustomButton: UIButton {
	var buttonNameInstance: String?

	var delegate: ICustomButtonDelegate?

	init(textButton: String, bgColor: UIColor, textColor: UIColor, isShadow: Bool) {
		super.init(frame: .zero)
		setupButton(text: textButton, bgColor: bgColor, textColor: textColor, shadow: isShadow)
		addAction()

		if isShadow {
			setupShadow()
			layoutSubviews()
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		let shadowPath = UIBezierPath(rect: bounds)
		layer.shadowPath = shadowPath.cgPath
	}
}

	// MARK: - Button's Action
extension CustomButton {
	private func addAction() {
		let action = UIAction { _ in
			self.delegate?.pressedButton(self)
		}
		addAction(action, for: .touchUpInside)
	}
}

	// MARK: - Setup Button View
private extension CustomButton {
	func setupButton(text: String, bgColor: UIColor, textColor: UIColor, shadow: Bool) {
		setTitle(text, for: .normal)
		setTitleColor(textColor, for: .normal)
		backgroundColor = bgColor
		layer.cornerRadius = 10

		widthAnchor.constraint(equalToConstant: 110).isActive = true
	}

	func setupShadow() {
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOpacity = 0.4
		layer.shadowOffset = CGSize(width: 5, height: 5)
		layer.shadowRadius = 7
	}
}
