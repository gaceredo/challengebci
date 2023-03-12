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
        case urlImage
        case offset
        case limit
        case genericErrorTitle
        case genericErrorMessage
        case titleButtonSuccess
        case titleButtonCancel
    }
    
    enum PokemonDetails: String, LocalizableString {
        var screen: String { "PokemonDetails" }
        case title
    }
}
