//
//  CustomCell.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 01.12.2024.
//

import UIKit

class CustomCell: UITableViewCell {
	
	private let fullNameLabel = UILabel()
	private let positionLabel = UILabel()
	
	private let photo = UIImageView()
	private let markButton = UIButton()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setup()
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(person: PersonModel) {
		fullNameLabel.text = person.fullName
		positionLabel.text = person.position
		photo.image = UIImage(named: person.imageName)
		
		let checkmark = person.isMark ? "checkmark.square.fill" : "checkmark"
		markButton.setImage(UIImage(systemName: checkmark), for: .normal)
	}
}

	//MARK: - Setting
private extension CustomCell {
	func setup() {
		contentView.addSubviews(fullNameLabel, positionLabel, photo, markButton)
		setupFullNameLabel()
		setupPositionLabel()
		setupPhoto()
		setupMarkButton()
		setupLayout()
	}
}

	//MARK: - Settings View
private extension CustomCell {
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
		markButton.tintColor = .systemTeal
	}
}

//MARK: - Layout
private extension CustomCell {
	func setupLayout() {
		[fullNameLabel, positionLabel, photo, markButton].forEach { view in
			view.translatesAutoresizingMaskIntoConstraints = false
			
			NSLayoutConstraint.activate([
				photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
				photo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
				photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
				
				fullNameLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 16),
				fullNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
				fullNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: markButton.leadingAnchor, constant: -8),
				
				positionLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
				positionLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 4),
				positionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
				
				markButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
				markButton.centerYAnchor.constraint(equalTo: fullNameLabel.centerYAnchor),
				markButton.widthAnchor.constraint(equalToConstant: 24),
				markButton.heightAnchor.constraint(equalToConstant: 24)
			])
		}
	}
}
