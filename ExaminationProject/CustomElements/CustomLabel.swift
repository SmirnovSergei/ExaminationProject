//
//  CustomLabel.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 14.11.2024.
//

import UIKit

class CustomLabel: UILabel {

	init(license: String) {
		super.init(frame: .zero)
//		setupLicenseLabel(license)
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupLicenseLabel() {
//		var customLabel
	}
}
