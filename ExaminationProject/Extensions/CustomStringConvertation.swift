//
//  CustomStringConvertation.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 20.10.2024.
//

import UIKit

extension PersonModel: CustomStringConvertible {
    var description: String {
        "\(imageName) - \(information)"
    }
}
