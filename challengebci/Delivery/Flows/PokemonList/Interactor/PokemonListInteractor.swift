//
//  PokemonListInteractor.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//  
//

import Foundation
import Combine

protocol PokemonListInteractorProtocol {
    func pokemonList(query: [URLQueryItem],completion: @escaping (Result< PokemonListModel, Error>) -> Void)
}

final class PokemonListInteractor: PokemonListInteractorProtocol {
    
    private let dependencies: PokemonListInteractorDependenciesProtocol
    private var cancellable: AnyCancellable?

    init(dependencies: PokemonListInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
    
    func pokemonList(query: [URLQueryItem],completion: @escaping (Result< PokemonListModel, Error>) -> Void) {
        cancellable = dependencies.pokemonList(query: query, .pokemonList)
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
