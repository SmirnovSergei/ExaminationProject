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
    
    private let lastButton = CustomButton(textButton: "Last", bgColor: .systemTeal, textColor: .white, isShadow: true)
    private let nextButton = CustomButton(textButton: "Next", bgColor: .white, textColor: .black, isShadow: true)
    private let firstButton = CustomButton(textButton: "First", bgColor: .systemRed, textColor: .white, isShadow: false)
    
    var personData: PersonManageable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lastButton.delegate = self
        nextButton.delegate = self
        firstButton.delegate = self
        lastButton.buttonNameInstance = "Last button"
        nextButton.buttonNameInstance = "Next button"
        firstButton.buttonNameInstance = "First button"
        
        imageView.imageNameInstance = "Image view"

        print("Количество переданных вьюшек UIButton = \(view.getButtonViewsQuantity(lastButton, nextButton, firstButton))\n")
        view.printAllSubviews(lastButton, nextButton, firstButton, imageView)

        view.backgroundColor = .white
        setupStackViews()
        setupLabels()
        view.addSubviews(vStackView, hStackView, firstButton)
        
        setupLayout()
    }
}

 // MARK: - ICustomButtonDelegate
extension ViewController: ICustomButtonDelegate {
     func pressedButton(_ button: UIButton) {
         switch button {
         case lastButton:
             if let lastPerson = self.personData?.getLastPerson() {
                 self.setPersonQueue(lastPerson)
                 
             } else {
                 self.positionLabel.text = "Значение не задано"
             }
             
         case nextButton:
             if let nextPerson = self.personData?.getNextPerson() {
                 self.setPersonQueue(nextPerson)
                 
             } else {
                 self.positionLabel.text = "Значение не задано"
             }
             
         case firstButton:
             if let firstPerson = self.personData?.getFirstPerson() {
                 self.setPersonQueue(firstPerson)
                 
             } else {
                 self.positionLabel.text = "Значение не задано"
             }
             
         default:
             break
         }
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
            
            firstButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
