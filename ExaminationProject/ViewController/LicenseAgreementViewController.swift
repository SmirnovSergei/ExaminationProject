//
//  LicenseAgreementViewController.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 12.11.2024.
//

import UIKit

class LicenseAgreementViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let licenseTitle = UILabel()
    private let licenseText = UILabel()
    
    var licenseAgreement: ILicenseAgreement?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
    }
}

// MARK: - Setting Views
private extension LicenseAgreementViewController {
    func setupViews() {
        view.backgroundColor = .systemGray4
        scrollView.backgroundColor = .white
        contentView.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(licenseTitle)
        contentView.addSubview(licenseText)
        
        setupLabels()
    }
    
    func setupLabels() {
        licenseTitle.text = licenseAgreement?.getLicenseAgreement().title
        licenseTitle.textColor = .black
        licenseTitle.font = .systemFont(ofSize: 16, weight: .bold)
        licenseTitle.numberOfLines = 0
        licenseTitle.textAlignment = .center
        
        licenseText.text = licenseAgreement?.getLicenseAgreement().text
        licenseText.textColor = .black
        licenseText.font = .systemFont(ofSize: 16)
        licenseText.numberOfLines = 0
        licenseText.textAlignment = .justified
    }
}

// MARK: - Setup Layout
private extension LicenseAgreementViewController {
    func setupLayout() {
        [scrollView,
        contentView,
        licenseTitle,
         licenseText].forEach({ view in
            view.translatesAutoresizingMaskIntoConstraints = false
        })
            
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 1250),
            
            licenseTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            licenseTitle.widthAnchor.constraint(equalTo: contentView.widthAnchor),

            licenseText.topAnchor.constraint(equalTo: licenseTitle.bottomAnchor, constant: 20),
            licenseText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            licenseText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25)
        ])
    }
}
