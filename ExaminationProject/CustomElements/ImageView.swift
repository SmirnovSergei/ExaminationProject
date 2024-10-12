//
//  ImageView.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 11.10.2024.
//

import UIKit

class ImageView: UIView {
    private let imageView = UIImageView()
    
    init(imageName: String) {
        super.init(frame: .zero)
        setupImageView(imageName)
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateImage(_ imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}

// MARK: - Setup Image View
private extension ImageView {
    func setupImageView(_ imageName: String) {
        imageView.image = UIImage(named: imageName)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
    }
}

// MARK: - Setup Image Layout
private extension ImageView {
    func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
