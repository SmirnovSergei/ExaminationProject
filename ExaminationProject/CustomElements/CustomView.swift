//
//  CustomView.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 05.12.2024.
//

import UIKit

class CustomView: UIView {
	
	private let fullNameLabel = UILabel()
	private let positionLabel = UILabel()
	
	private let photo = UIImageView()
	
	private let checkmarkButton = UIButton()
	private var toggleCheckmark = false
	
	var action: (() -> ())?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		UIView.animate(withDuration: 0.25) {
			self.layer.opacity = 0.6
		} completion: { _ in
			self.layer.opacity = 1.0
		}
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(person: PersonModel) {
		fullNameLabel.text = person.fullName
		positionLabel.text = person.position
		photo.image = UIImage(named: person.imageName)
		toggleCheckmark = person.isMark
		
		let checkmark = toggleCheckmark ? "checkmark.square.fill" : "checkmark.square"
		checkmarkButton.setImage(UIImage(systemName: checkmark), for: .normal)
	}
	
	@objc
	private func toggleMarkButton() {
		toggleCheckmark.toggle()
		let checkmark = toggleCheckmark ? "checkmark.square.fill" : "checkmark.square"
		checkmarkButton.setImage(UIImage(systemName: checkmark), for: .normal)
		
		action?()
	}
}

	//MARK: - Setting
private extension CustomView {
	func setup() {
		backgroundColor = .white
		layer.cornerRadius = 20
		
		addSubviews(
			fullNameLabel,
			positionLabel,
			photo,
			checkmarkButton
		)
		
		setupFullNameLabel()
		setupPositionLabel()
		setupPhoto()
		setupMarkButton()
		setupLayout()
	}
}

	//MARK: - Settings View
private extension CustomView {
	func setupFullNameLabel() {
		fullNameLabel.font = .boldSystemFont(ofSize: 21)
		fullNameLabel.textColor = .black
	}
	
	func setupPositionLabel() {
		positionLabel.textColor = .darkGray
	}
	
	func setupPhoto() {
		photo.widthAnchor.constraint(equalToConstant: 100).isActive = true
		photo.heightAnchor.constraint(equalToConstant: 100).isActive = true
		photo.contentMode = .scaleAspectFit
	}
	
	func setupMarkButton() {
		checkmarkButton.tintColor = .systemTeal
		checkmarkButton.addTarget(self, action: #selector(toggleMarkButton), for: .touchUpInside)
	}
}

//MARK: - Layout
private extension CustomView {
	func setupLayout() {
		[fullNameLabel,
		 positionLabel,
		 photo,
		 checkmarkButton].forEach { view in
			view.translatesAutoresizingMaskIntoConstraints = false
		}
		
		NSLayoutConstraint.activate([
			photo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			photo.topAnchor.constraint(equalTo: topAnchor, constant: 16),
			photo.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -16),
			
			fullNameLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 16),
			fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
			fullNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: checkmarkButton.leadingAnchor, constant: -8),
			
			positionLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
			positionLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 4),
			positionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			
			checkmarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			checkmarkButton.centerYAnchor.constraint(equalTo: fullNameLabel.centerYAnchor),
			checkmarkButton.widthAnchor.constraint(equalToConstant: 24),
			checkmarkButton.heightAnchor.constraint(equalToConstant: 24)
		])
	}
}
