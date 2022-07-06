//
//  CharacterDetailViewController.swift
//  Harry Potter Characters
//
//  Created by Scott Cox on 6/4/22.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var patronusLabel: UILabel!
    
    
    var character: Character? {
        didSet {
            updateViews()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    

    func updateViews() {
        loadViewIfNeeded()
        self.title = character?.name
        characterNameLabel.text = character?.name
        houseLabel.text = character?.house
        speciesLabel.text = character?.species
        patronusLabel.text = character?.patronus
    }

}
