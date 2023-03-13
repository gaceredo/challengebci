//
//  PokemonListModel.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import Foundation
import RealmSwift

class PokemonListModel:Object, Decodable {
    @objc dynamic var count: Int = 0
    @objc dynamic var next: String = ""
    var results = List<PokemonListModelResult>()

    enum CodingKeys: String, CodingKey {
        case count
        case next
        case results
    }
}

class PokemonListModelResult:Object, Decodable {
    @objc dynamic var name: String = ""
    @objc dynamic var url: String
    @objc dynamic var id: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
}
