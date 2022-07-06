//
//  CharacterListTableViewController.swift
//  Harry Potter Characters
//
//  Created by Scott Cox on 6/2/22.
//

import UIKit

class CharacterListTableViewController: UITableViewController {
    
    var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        CharacterController.fetchCharacterDetails { characters in
            guard let characters = characters else { return }
            self.characters = characters
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        
        let character = characters[indexPath.row]
        cell.textLabel?.text = character.name
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCharacterDetailVC",
           let destination = segue.destination as? CharacterDetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                let characterToSend = characters[indexPath.row]
                
                destination.character = characterToSend
            }
        }
    }
    
}
