//
//  PokemonDetailsInteractorDependencies.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//  
//

import Foundation
import Combine

protocol PokemonDetailsInteractorDependenciesProtocol {
    func pokemonDetails(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher<PokemonDetailsModel, Error>
}

class PokemonDetailsInteractorDependencies: RequestProtocol, PokemonDetailsInteractorDependenciesProtocol {
    
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

    func pokemonDetails(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher<PokemonDetailsModel, Error> {
        execute(feedKind.request(query: query), decodingType: PokemonDetailsModel.self)
    }
}
