//
//  PokemonDetailsModel.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import Foundation

struct PokemonDetailsModel: Decodable {
    let id: Int
    let height: Int
    let weight: Int
    let name: String
    let order: Int
    let types: [PokemonDetailsTypes]
    let abilities: [PokemonDetailsAbilities]
    let stats: [PokemonDetailsStats]
    let baseExperience: Int
    
    enum CodingKeys: String, CodingKey {
        case baseExperience = "base_experience"
        case id
        case height
        case weight
        case name
        case order
        case types
        case abilities
        case stats
    }
}

struct PokemonDetailsTypes: Decodable {
    let slot: Int
    let type: PokemonDetailsPokeType
}

struct PokemonDetailsPokeType: Decodable {
    let name: String
    let url: String
}

struct PokemonDetailsAbilities: Decodable {
    let slot: Int
    let ability: PokemonDetailsPokeAbility
    let isHidden: Bool
    
    enum CodingKeys: String, CodingKey {
        case isHidden = "is_hidden"
        case slot
        case ability
    }
}

struct PokemonDetailsPokeAbility: Decodable {
    let name: String
    let url: String
}

struct PokemonDetailsStats: Decodable {
    let baseStat: Int
    let effort: Int
    let stat: PokemonDetailsPokeStat
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
        case stat
    }
}

struct PokemonDetailsPokeStat: Decodable {
    let name: String
    let url: String
}
