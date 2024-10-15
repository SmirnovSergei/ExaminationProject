//
//  UIView+addSubviews.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 15.10.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
