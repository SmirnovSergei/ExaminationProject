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
    private let lastButton = CustomButton(textButton: "Last", bgColor: .systemTeal, textColor: .white, shadow: true)
    private let nextButton = CustomButton(textButton: "Next", bgColor: .white, textColor: .black, shadow: true)
    private let firstButton = CustomButton(textButton: "First", bgColor: .systemRed, textColor: .white, shadow: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupStackViews()
        setupLabels()
        view.addSubviews(vStackView, hStackView, firstButton)
        addAction()
        
        setupLayout()
    }
}

// MARK: - Button's Action
private extension ViewController {
    func addAction() {
        let lastAction = UIAction { _ in
            let lastPerson = personData.getLastPerson()
            self.imageView.updateImage(lastPerson.imageName)
            self.positionLabel.text = lastPerson.position
            self.textLabel.text = lastPerson.information
        }
        
        let nextAction = UIAction { _ in
            let nextPerson = personData.getNextPerson()
            self.imageView.updateImage(nextPerson.imageName)
            self.positionLabel.text = nextPerson.position
            self.textLabel.text = nextPerson.information
        }
        
        let firstAction = UIAction { _ in
            let firstPerson = personData.getFirstPerson()
            self.imageView.updateImage(firstPerson.imageName)
            self.positionLabel.text = firstPerson.position
            self.textLabel.text = firstPerson.information
        }
        
        lastButton.addAction(lastAction, for: .touchUpInside)
        nextButton.addAction(nextAction, for: .touchUpInside)
        firstButton.addAction(firstAction, for: .touchUpInside)
    }
}

// MARK: - Setup Views
private extension ViewController {
    func setupLabels() {
        positionLabel.text = personData.getCurrentPerson().position
        positionLabel.font = .systemFont(ofSize: 30, weight: .bold)
        positionLabel.textAlignment = .center
        positionLabel.textColor = .black
        
        textLabel.numberOfLines = 0
        textLabel.text = personData.getCurrentPerson().information
        textLabel.font = .systemFont(ofSize: 20)
        textLabel.textAlignment = .justified
        textLabel.textColor = .black
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
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            vStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            imageView.heightAnchor.constraint(equalTo: vStackView.widthAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            positionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            positionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textLabel.topAnchor.constraint(equalTo: positionLabel.bottomAnchor),
            
            hStackView.bottomAnchor.constraint(equalTo: firstButton.topAnchor, constant: -70),
            hStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            firstButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

