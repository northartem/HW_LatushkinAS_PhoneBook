//
//  PersoneListViewController.swift
//  HW_LatushkinAS_PhoneBook
//
//  Created by Артём Латушкин on 04.03.2023.
//

import UIKit

class PersonListViewController: UITableViewController {
    
    var persons: [Person] = []
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let contactInfoVC = segue.destination as? ContactInfoViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        contactInfoVC?.persone = persons[indexPath.row]
    }
}

// MARK: - UITableViewDataSorse
extension PersonListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let contact = persons[indexPath.row]
        
        content.text = contact.name
        content.secondaryText = contact.surname
        cell.contentConfiguration = content
        
        return cell
    }
}
