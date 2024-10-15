//
//  UIStackView+addStackViews.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 11.10.2024.
//

import UIKit

extension UIStackView {
    func addStackViews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
