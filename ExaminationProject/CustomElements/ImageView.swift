//
//  ImageView.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 11.10.2024.
//

import UIKit

class ImageView: UIImageView {
	var imageNameInstance: String?

	init(imageName: String) {
		super.init(frame: .zero)
		setupImageView(imageName)
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func updateImage(_ imageName: String) {
		image = UIImage(named: imageName)
	}
}

	// MARK: - Setup Image View
private extension ImageView {
	func setupImageView(_ imageName: String) {
		image = UIImage(named: imageName)
		clipsToBounds = true
		contentMode = .scaleAspectFit
	}
}
