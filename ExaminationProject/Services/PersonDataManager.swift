//
//  PersonDataManager.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 15.10.2024.
//

import UIKit

protocol PersonManageable {
	func getCurrentPerson() -> PersonModel
	func getLastPerson() -> PersonModel
	func getNextPerson() -> PersonModel
	func getFirstPerson() -> PersonModel
	func getPersonModelByImageName(_ imageName: String) -> PersonModel?
	func getRandomPerson() -> PersonModel
	func getAllPersons() -> [PersonModel]
	func removePerson(index: Int)
	func markPerson(index: Int)
}

class PersonDataManager: PersonManageable {
	private var persons: [PersonModel] = []
	private var currentIndex = 0

	init(persons: [PersonModel]) {
		self.persons = persons
	}

	func getAllPersons() -> [PersonModel] {
		persons
	}

	func getCurrentPerson() -> PersonModel {
		persons[currentIndex]
	}

	func getLastPerson() -> PersonModel {
		if currentIndex > 0 {
			currentIndex -= 1
		}
		return getCurrentPerson()
	}

	func getNextPerson() -> PersonModel {
		if currentIndex < persons.count - 1 {
			currentIndex += 1
		}
		return getCurrentPerson()
	}

	func getFirstPerson() -> PersonModel {
		currentIndex = 0

		return getCurrentPerson()
	}

	func getPersonModelByImageName(_ imageName: String) -> PersonModel? {
		for person in persons {
			if person.imageName == imageName {
				return person
			}
		}
		return nil
	}

	func getRandomPerson() -> PersonModel {
		for _ in persons {
			currentIndex = Int.random(in: 0...(persons.count - 1))
		}
		return getCurrentPerson()
	}

	func removePerson(index: Int) {
		persons.remove(at: index)
	}

	func markPerson(index: Int) {
		persons[index].isMark.toggle()
	}
}
