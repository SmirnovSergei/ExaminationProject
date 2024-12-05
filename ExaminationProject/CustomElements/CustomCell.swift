//
//  CustomCell.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 01.12.2024.
//

import UIKit

class CustomCell: UITableViewCell {
	
	private let customView = CustomView()
	
	var action: ((UITableViewCell) -> ())?
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setup()
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(person: PersonModel) {
		customView.configure(person: person)
		customView.action = toggleCheckmarkButton
	}
	
	private func toggleCheckmarkButton() {
		action?(self)
	}
}

	//MARK: - Setting
private extension CustomCell {
	func setup() {
		backgroundColor = .darkGray
		contentView.addSubviews(customView)
		setupLayout()
	}
}

	//MARK: - Layout
private extension CustomCell {
	func setupLayout() {
		customView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			customView.topAnchor.constraint(equalTo: contentView.topAnchor),
			customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
			customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
			customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
		])
	}
}
