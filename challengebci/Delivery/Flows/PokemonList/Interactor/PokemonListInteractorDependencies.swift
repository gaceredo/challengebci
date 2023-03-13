//
//  PokemonListInteractorDependencies.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//  
//

import Foundation
import Combine

protocol PokemonListInteractorDependenciesProtocol {
    func pokemonList(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher<PokemonListModel, Error>
    func menuOptions(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher<PokemonMenuModel, Error>
}

class PokemonListInteractorDependencies: RequestProtocol, PokemonListInteractorDependenciesProtocol {
    
    var session: URLSession
    var error: ResponseHandlingError
    
    init(configuration: URLSessionConfiguration,
         error: ResponseHandlingError = ResponseHandlingError()) {
        self.session = URLSession(configuration: configuration)
        self.error = error
    }
    
    convenience init() {
        self.init(configuration: .default)
    }

    func pokemonList(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher< PokemonListModel, Error> {
        execute(feedKind.request(query: query), decodingType: PokemonListModel.self)
    }
    func menuOptions(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher<PokemonMenuModel, Error> {
        execute(feedKind.request(query: query), decodingType: PokemonMenuModel.self)
    }
}

