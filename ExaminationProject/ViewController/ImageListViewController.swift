//
//  ImageListViewController.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 27.11.2024.
//

import UIKit

class ImageListViewController: UIViewController {
	
	private let tableView = UITableView()
	private let cellIdentifier = "cellIdentifier"

	var personData: PersonManageable?

	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		setupLayout()
	}
}

	//MARK: - UITableViewDataSource
extension ImageListViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		personData?.getAllPersons().count ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
		let person = personData?.getAllPersons()[indexPath.row]

		var configuration = cell.defaultContentConfiguration()
		configuration.image = UIImage(named: person?.imageName ?? "")
		configuration.text = person?.fullName
		configuration.secondaryText = person?.position

		if person?.isMark == true {
			cell.accessoryType = .checkmark
		} else {
			cell.accessoryType = .none
		}

		cell.contentConfiguration = configuration

		return cell
	}
}

	//MARK: - UITableViewDelegate
extension ImageListViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		100
	}

	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

		let markAction = UIContextualAction(style: .normal, title: "Mark") { _, _, completion in
			self.personData?.markPerson(index: indexPath.row)
			tableView.reloadRows(at: [indexPath], with: .automatic)

			completion(true)
		}

		markAction.backgroundColor = .systemGreen

		let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, completion in
			self.personData?.removePerson(index: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .automatic)

			completion(true)
		}

		let configuration = UISwipeActionsConfiguration(actions: [deleteAction, markAction])
		return configuration
	}
}

	//MARK: - Setiing View
extension ImageListViewController {
	func setupView() {
		view.backgroundColor = .white
		view.addSubview(tableView)
		setupTableView()
	}

	func setupTableView() {
		tableView.dataSource = self
		tableView.delegate = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
	}
}

	//MARK - Layout
extension ImageListViewController {
	func setupLayout() {
		tableView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
}
