//
//  PokemonListInteractorDependenciesMock.swift
//  challengebciTests
//
//  Created by Gustavo Aceredo on 13/3/23.
//

import Foundation
import Combine
import challengebci

protocol PokemonListInteractorDependenciesProtocolMock {
    func pokemonListSuccess(query: [URLQueryItem],_ feedKind: FeedMock) -> AnyPublisher<PokemonListModelMock, Error>
    func pokemonListFail(query: [URLQueryItem],_ feedKind: FeedMock) -> AnyPublisher<PokemonListModelMock, Error>
}

class PokemonListInteractorDependenciesMock: RequestProtocolMock, PokemonListInteractorDependenciesProtocolMock {

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
    
    func pokemonListSuccess(query: [URLQueryItem], _ feedKind: FeedMock) -> AnyPublisher<PokemonListModelMock, Error> {
        execute(feedKind.request(query: query), decodingType: PokemonListModelMock.self)
    }
    
    func pokemonListFail(query: [URLQueryItem], _ feedKind: FeedMock) -> AnyPublisher<PokemonListModelMock, Error> {
        execute(feedKind.request(query: query), decodingType: PokemonListModelMock.self)
    }

}
 
