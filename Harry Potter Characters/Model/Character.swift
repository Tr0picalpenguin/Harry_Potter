//
//  Character.swift
//  Harry Potter Characters
//
//  Created by Scott Cox on 6/2/22.
//

import Foundation

enum CharacterKeys: String {
    
    case kName = "name"
    case kSpecies = "species"
    case kHouse = "house"
    case kPatronus = "patronus"
}

class Character {
    let name: String
    let species: String
    let house: String
    let patronus: String
    
    init(name: String, species: String, house: String, patronus: String) {
    self.name = name
    self.species = species
    self.house = house
    self.patronus = patronus

    }
} // End of class

extension Character {
    
    convenience init?(characterDictionary: [String:Any]) {
        guard let name = characterDictionary[CharacterKeys.kName.rawValue] as? String,
        let species = characterDictionary[CharacterKeys.kSpecies.rawValue] as? String,
        let house = characterDictionary[CharacterKeys.kHouse.rawValue] as? String,
        let patronus = characterDictionary[CharacterKeys.kPatronus.rawValue] as? String else {return nil}
        
        self.init(name: name, species: species, house: house, patronus: patronus)
    }
} // End of extension
