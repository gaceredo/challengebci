//
//  PokemonMenuInteractorDependencies.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 13/3/23.
//  
//

import Foundation
import Combine

protocol PokemonMenuInteractorDependenciesProtocol {
    func pokemonMenu(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher<PokemonMenuDetails, Error>
}

class PokemonMenuInteractorDependencies: RequestProtocol, PokemonMenuInteractorDependenciesProtocol {
    
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

    func pokemonMenu(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher<PokemonMenuDetails, Error> {
        execute(feedKind.request(query: query), decodingType: PokemonMenuDetails.self)
    }
}
