//
//  PersonModel.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 11.10.2024.
//

import UIKit

struct PersonModel {
	let imageName: String
	let position: String
	let firstName: String
	let lastName: String
	let age: Int
	let info: String
	var isMark: Bool

	var fullName: String {
		firstName + " " + lastName
	}

	var information: String {
		"\(fullName)\nВозраст: \(age)\n\(info)"
	}
}

extension PersonModel: Equatable {}
