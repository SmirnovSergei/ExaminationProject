//
//  FindImageViewController.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 04.11.2024.
//

import UIKit

class FindImageViewController: UIViewController {

	private let textLabel = UILabel()
	private let textField = UITextField()
	private let imageInfoLabel = UILabel()

	private let checkButton = UIButton()

	private let imageView = ImageView(imageName: "")
    
    var personData: PersonManageable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupLayout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        checkImage()
    }
    
    @objc private func checkButtonTapped() {
        checkImage()
    }
}

// MARK: - Check Image
private extension FindImageViewController {
    func checkImage() {
        if let person = personData?.getPersonModelByImageName(textField.text ?? "") {
            textLabel.text = "Такая картинка есть"
            textLabel.textColor = .black
            
            imageView.updateImage(person.imageName)
            imageInfoLabel.text = person.position
            
            view.endEditing(true)
            
        } else {
            textLabel.text = "Такой картинки нет"
            textLabel.textColor = .red
            textField.text = ""
            
            imageView.image = nil
            imageInfoLabel.text = ""
        }
    }
}

// MARK: - Setup Views
private extension FindImageViewController {
    func setupViews() {
        view.backgroundColor = .white
        
        textField.delegate = self
        
        setupTextLabel()
        setupTextField()
        setupCheckButton()
        setupImageView()
        setupImageInfoLabel()
        
        view.addSubviews(
            textLabel,
            textField,
            checkButton,
            imageView,
            imageInfoLabel
        )
    }
    
    func setupTextLabel() {
        textLabel.text = "Введите название картинки"
        textLabel.font = .systemFont(ofSize: 20, weight: .bold)
        textLabel.textColor = .black
    }
    
    func setupTextField() {
        textField.placeholder = "Название картинки"
        textField.borderStyle = .roundedRect
        
    }
    
    func setupCheckButton() {
        checkButton.setTitle("Проверить", for: .normal)
        checkButton.setTitleColor(.systemCyan, for: .normal)
        checkButton.addTarget(
            self,
            action: #selector(checkButtonTapped),
            for: .touchUpInside
        )
    }
        
    func setupImageView() {
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
    }
    
    func setupImageInfoLabel() {
        imageInfoLabel.font = .systemFont(ofSize: 30, weight: .bold)
        imageInfoLabel.textAlignment = .center
        imageInfoLabel.textColor = .black
    }
}

// MARK: - Setup Layout
private extension FindImageViewController {
    func setupLayout() {
        [textLabel,
         textField,
         checkButton,
         imageView,
         imageInfoLabel].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 90),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            checkButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            checkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: checkButton.bottomAnchor, constant: 50),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageInfoLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            imageInfoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

// MARK: - UITextFieldDelegate
extension FindImageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkImage()
        return true
    }
}

