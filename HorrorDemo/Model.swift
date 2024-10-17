//
//  Model.swift
//  HorrorDemo
//
//  Created by Bridgeth Segovia on 16/10/24.
//

import Foundation

struct HorrorCharacter: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String
    let movie: String
    let characterType: String
    let image: String
    let quote: String
}

class CharacterLoader: ObservableObject {
    @Published var characters: [HorrorCharacter] = []
    
    init() {
        loadCharacters()
    }
    
    func loadCharacters() {
        if let url = Bundle.main.url(forResource: "HorrorCharacter", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let decodedCharacters = try? JSONDecoder().decode([HorrorCharacter].self, from: data) {
            self.characters = decodedCharacters
        } else {
            print("Error al cargar los datos del JSON.")
        }
    }
}
