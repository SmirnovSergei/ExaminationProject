//
//  ViewController.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 11.10.2024.
//

import UIKit

class ViewController: UIViewController {
	private let vStackView = UIStackView()
	private let hStackView = UIStackView()

	private let imageView = ImageView(imageName: "investor")

	private let positionLabel = UILabel()
	private let textLabel = UILabel()
	private let imageLabel = UILabel()

	private let lastButton = CustomButton(textButton: "Last", bgColor: .systemTeal, textColor: .white, isShadow: true)
	private let nextButton = CustomButton(textButton: "Next", bgColor: .white, textColor: .black, isShadow: true)
	private let firstButton = CustomButton(textButton: "First", bgColor: .systemRed, textColor: .white, isShadow: false)

	var personData: PersonManageable?


	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		addAction()
		setupLayout()
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		positionLabel.text = personData?.getCurrentPerson().imageName

		if let touch = touches.first {
			let location = touch.location(in: imageView)

			if imageView.frame.contains(location) {
				imageLabel.text = personData?.getCurrentPerson().imageName
				imageLabel.isHidden = false
			}
		}
	}
}

// MARK: - Button's Action
private extension ViewController {
	func addAction() {
		let lastAction = UIAction { _ in
			if let lastPerson = self.personData?.getLastPerson() {
				self.setPersonQueue(lastPerson)
				self.imageLabel.isHidden = true
			}
		}

		let nextAction = UIAction { _ in
			if let nextPerson = self.personData?.getNextPerson() {
				self.setPersonQueue(nextPerson)
				self.imageLabel.isHidden = true
			}
		}

		let firstAction = UIAction { _ in
			if let firstPerson = self.personData?.getFirstPerson() {
				self.setPersonQueue(firstPerson)
				self.imageLabel.isHidden = true
			}
		}

		lastButton.addAction(lastAction, for: .touchUpInside)
		nextButton.addAction(nextAction, for: .touchUpInside)
		firstButton.addAction(firstAction, for: .touchUpInside)
	}

	func setPersonQueue(_ personQueue: PersonModel) {
		let personQueue = personQueue
		self.imageView.updateImage(personQueue.imageName)
		self.positionLabel.text = personQueue.position
		self.textLabel.text = personQueue.information
	}
}

// MARK: - Setup Views
private extension ViewController {
	func setupViews() {
		view.backgroundColor = .white
		setupStackViews()
		setupLabels()

		view.addSubviews(vStackView, imageLabel, hStackView, firstButton)
	}
}

private extension ViewController {
	func setupLabels() {
		positionLabel.text = personData?.getCurrentPerson().position
		positionLabel.font = .systemFont(ofSize: 30, weight: .bold)
		positionLabel.textAlignment = .center
		positionLabel.textColor = .black

		textLabel.numberOfLines = 0
		textLabel.text = personData?.getCurrentPerson().information
		textLabel.font = .systemFont(ofSize: 20)
		textLabel.textAlignment = .justified
		textLabel.textColor = .black

		imageLabel.text = ""
		imageLabel.font = .systemFont(ofSize: 30, weight: .bold)
		imageLabel.textAlignment = .center
		imageLabel.textColor = .systemRed
	}

	func setupStackViews() {
		vStackView.axis = .vertical
		vStackView.distribution = .equalSpacing
		vStackView.alignment = .fill

		hStackView.axis = .horizontal
		hStackView.distribution = .fillEqually
		hStackView.alignment = .center
		hStackView.spacing = 50

		vStackView.addStackViews(imageView, positionLabel, textLabel)
		hStackView.addStackViews(lastButton, nextButton)
	}
}

// MARK: - Setup Layout
private extension ViewController {
	func setupLayout() {
		[vStackView,
		 imageLabel,
		 hStackView,
		 firstButton].forEach { view in
			view.translatesAutoresizingMaskIntoConstraints = false
		}

		NSLayoutConstraint.activate([
			vStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			vStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			vStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),

			imageView.heightAnchor.constraint(equalTo: vStackView.widthAnchor),
			positionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
			textLabel.topAnchor.constraint(equalTo: positionLabel.bottomAnchor),

			imageLabel.bottomAnchor.constraint(equalTo: hStackView.topAnchor, constant: -40),
			imageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

			hStackView.bottomAnchor.constraint(equalTo: firstButton.topAnchor, constant: -40),
			hStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

			firstButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
			firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
}
