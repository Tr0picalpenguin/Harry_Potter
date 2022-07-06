//
//  CharacterController.swift
//  Harry Potter Characters
//
//  Created by Scott Cox on 6/2/22.
//

import Foundation

class CharacterController {
    
    private static let baseURLString = "https://hp-api.herokuapp.com"
    private static let apiComponent = "api"
    static private let characterComponent = "characters"

    
    static func fetchCharacterDetails(completion: @escaping ([Character]?) -> Void) {
       
        // set up the url.
        guard let url = URL(string: baseURLString) else {
            completion(nil)
            return
        }
        let apiURL = url.appendingPathComponent(apiComponent)
        let finalURL = apiURL.appendingPathComponent(characterComponent)
        print(finalURL)
        // perform the dataTask
        URLSession.shared.dataTask(with: finalURL) { characterData, _, error in
            if let error = error {
                print("WTF! Encountered an Error 🤬", error.localizedDescription)
                completion(nil);return
            }
            // check for data
            guard let characterData = characterData else {
                completion(nil)
                return
            }
            do {
                guard let topLevelDictionary = try JSONSerialization.jsonObject(with: characterData, options: .fragmentsAllowed) as? [[String:Any]] else {
                    completion(nil)
                    return
                }
                var tempArray: [Character] = []
                for characterDict in topLevelDictionary {
                    guard let character = Character(characterDictionary: characterDict) else {
                        completion(nil)
                        return
                    }
                    // Add the initialized character to my temp array
                    tempArray.append(character)
                }
                completion(tempArray)
            } catch {
                print("WTF! Error Decoding the data 🤬", error.localizedDescription)
                completion(nil);return
            }
        }.resume()
    }
} // End of class
