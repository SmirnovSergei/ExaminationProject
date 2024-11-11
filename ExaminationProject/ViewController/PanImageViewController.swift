//
//  PanImageViewController.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 11.11.2024.
//

import UIKit

class PanImageViewController: UIViewController {
    
    private let imageView = ImageView(imageName: "")
    private let panGestureRecognizer = UIPanGestureRecognizer()
    private var panGestureAnchorPoint: CGPoint?
    
    private var centerXConstraint: NSLayoutConstraint!
    private var centerYConstraint: NSLayoutConstraint!
    
    var personData: PersonManageable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupImageView()
        getRandomImage()
        setupLayout()
        setupGestureRecognizer()
    }
    
    @objc
    func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard panGestureRecognizer === gestureRecognizer else {
            return
        }
        
        switch gestureRecognizer.state {
        case .began:
            panGestureAnchorPoint = gestureRecognizer.location(in: view)
        case .changed:
            guard let panGestureAnchorPoint = panGestureAnchorPoint else { return }
            
            let gesturePoint = gestureRecognizer.location(in: view)
            
            centerXConstraint.constant += gesturePoint.x - panGestureAnchorPoint.x
            centerYConstraint.constant += gesturePoint.y - panGestureAnchorPoint.y
            self.panGestureAnchorPoint = gesturePoint
        case .cancelled, .ended:
            panGestureAnchorPoint = nil
        case .possible, .failed:
            break
        @unknown default:
            break
        }
    }
    
    func getRandomImage() {
        let person = personData?.getRandomPerson()
        imageView.image = UIImage(named: person?.imageName ?? "")
    }
    
    private func setupImageView() {
        view.addSubview(imageView)
        imageView.layer.cornerRadius = Constants.imageViewCornerRadius
    }
    
    private func setupGestureRecognizer() {
        panGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(_:)))
        
        imageView.addGestureRecognizer(panGestureRecognizer)
    }
    
    private func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = imageView.widthAnchor.constraint(
            equalToConstant: Constants.initialImageViewDimSize
        )
        let heightConstraint = imageView.heightAnchor.constraint(
            equalToConstant: Constants.initialImageViewDimSize
        )
        centerXConstraint = imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        centerYConstraint = imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        NSLayoutConstraint.activate([
            widthConstraint,
            heightConstraint,
            centerXConstraint,
            centerYConstraint
        ])
    }
}

private extension PanImageViewController {
    enum Constants {
        static let imageViewCornerRadius: CGFloat = 30.0
        static let initialImageViewDimSize: CGFloat = 250.0
    }
}
