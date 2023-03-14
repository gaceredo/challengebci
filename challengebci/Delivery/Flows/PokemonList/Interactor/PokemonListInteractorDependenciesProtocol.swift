//
//  PokemonListInteractorDependenciesProtocol.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 13/3/23.
//

import Foundation
import Combine

protocol PokemonListInteractorDependenciesProtocol {
    func pokemonList(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher<PokemonListModel, Error>
    func menuOptions(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher<PokemonMenuModel, Error>
}
