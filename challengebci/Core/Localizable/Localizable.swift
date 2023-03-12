//
//  Localizable.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import Foundation

enum Localizable {
    
    enum PokemonListView: String, LocalizableString {
        var screen: String { "PokemonListView" }
        case title
        
    }
    enum PokemonDetails: String, LocalizableString {
        var screen: String { "PokemonDetails" }
        case title
    }
}
