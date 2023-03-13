//
//  Feed.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import Foundation

enum Feed {
    case pokemonList
    case pokemonDetails(id: Int)
    case menu
    case menuDetails(url: String)
}

extension Feed: Endpoint {
    
    var httpMethod: RequestMethod {
        switch self {
        case .pokemonList, .pokemonDetails, .menu, .menuDetails:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .pokemonDetails(let id):
            return "/api/v2/pokemon/\(id)"
        case .pokemonList:
            return "/api/v2/pokemon"
        case .menu:
            return "/api/v2/"
        case .menuDetails(let url):
            return url
        }
    }
}
