//
//  SceneDelegate.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 11.10.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		guard let windowScene = (scene as? UIWindowScene) else { return }
			// Создаем окно для сцены
		window = UIWindow(windowScene: windowScene)

		let viewController = MarTableViewController()
		viewController.personData = buildPersonManager()

		printDescription()

			// Устанавливаем корневой контроллер в окне
		window?.rootViewController = viewController
			// Отображаем окно на экране
		window?.makeKeyAndVisible()
	}

	private func printDescription() {
		let sortedPersonData = PersonManager().getPersons().sorted(by: <)

		for person in sortedPersonData {
			print("\(person.description)\n")
		}
	}
}

extension SceneDelegate {
	func buildPersonManager() -> PersonManageable {
		let personData = PersonDataManager(persons: PersonManager().getPersons())
		return personData
	}
}
