//
//  PokemonMenuDetails.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 13/3/23.
//

import Foundation

// MARK: - PokemonMenuDetails
struct PokemonMenuDetails: Decodable {
    let results: [PokemonMenuDetailsResult]

    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}

// MARK: - Result
struct PokemonMenuDetailsResult: Decodable {
    let name: String?
    let url: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}
