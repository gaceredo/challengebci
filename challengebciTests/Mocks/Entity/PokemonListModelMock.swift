//
//  PokemonListModel.swift
//  challengebciTests
//
//  Created by Gustavo Aceredo on 13/3/23.
//

import Foundation

struct PokemonListModelMock: Decodable {
    var count: Int
    var next: String
    var results: [PokemonListModelResultMock]

    enum CodingKeys: String, CodingKey {
        case count
        case next
        case results
    }
}

struct PokemonListModelResultMock: Decodable {
     var name: String
     var url: String
     var id: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
