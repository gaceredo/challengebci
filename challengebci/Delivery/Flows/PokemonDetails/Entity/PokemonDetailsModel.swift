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
    let base_experience: Int
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
    let is_hidden: Bool
}

struct PokemonDetailsPokeAbility: Decodable {
    let name: String
    let url: String
}

struct PokemonDetailsStats: Decodable {
    let base_stat: Int
    let effort: Int
    let stat: PokemonDetailsPokeStat
}

struct PokemonDetailsPokeStat: Decodable {
    let name: String
    let url: String
}
