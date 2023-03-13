//
//  PokemonMenuInteractor.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 13/3/23.
//  
//

import Foundation
import Combine

protocol PokemonMenuInteractorProtocol {
    func pokemonMenu(url: String, query: [URLQueryItem],
                     completion: @escaping (Result<PokemonMenuDetails, Error>) -> Void)

}

final class PokemonMenuInteractor: PokemonMenuInteractorProtocol {

    private let dependencies: PokemonMenuInteractorDependenciesProtocol
    private var cancellable: AnyCancellable?

    init(dependencies: PokemonMenuInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
    
    func pokemonMenu(url: String,
                     query: [URLQueryItem],
                     completion: @escaping (Result<PokemonMenuDetails, Error>) -> Void) {
        
        cancellable = dependencies.pokemonMenu(query: query, .menuDetails(url: url))
            .sink(receiveCompletion: { result in
                switch result {
                case .finished : break
                case .failure(let error):
                    completion(.failure(error))
                }
            },
            receiveValue: {
                completion(.success($0))
            })
    }
}
