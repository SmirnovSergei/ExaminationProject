//
//  CompareImageName.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 20.10.2024.
//

import UIKit

extension PersonModel: Comparable {
    static func == (lhs: PersonModel, rhs: PersonModel) -> Bool {
        lhs.imageName == rhs.imageName
    }
    
    static func < (lhs: PersonModel, rhs: PersonModel) -> Bool {
        lhs.imageName < rhs.imageName
    }
}
