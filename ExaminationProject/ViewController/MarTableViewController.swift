//
//  MarTableViewController.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 01.12.2024.
//

import UIKit

class MarTableViewController: UITableViewController {
	
	var personData: PersonManageable?
	
	private let cellIdentifier = "cellIdentifier"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.register(CustomCell.self, forCellReuseIdentifier: cellIdentifier)
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		personData?.getIsMarkPersons().count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CustomCell else {
			return UITableViewCell()
		}
		
		if let person = personData?.getIsMarkPersons()[indexPath.row] {
			
			cell.configure(person: person)
		}
		
		cell.checkmarkTapped = { cell in
			if let indexPath = tableView.indexPath(for: cell) {
				if let person = self.personData?.getIsMarkPersons()[indexPath.row] {
					self.personData?.toggleMark(person)
				}
				tableView.deleteRows(at: [indexPath], with: .automatic)
			}
		}
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}


