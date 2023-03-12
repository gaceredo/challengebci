//
//  PokemonListModel.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import Foundation

struct PokemonListModel: Decodable {
    let count: Int
    let next: String?
    let results: [PokemonListModelResult]

    enum CodingKeys: String, CodingKey {
        case count
        case next
        case results
    }
}

struct PokemonListModelResult: Decodable {
    let name: String
    var url: String
    var id: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
