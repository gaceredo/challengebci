//
//  PokemonDetailsInteractor.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//  
//

import Foundation
import Combine

protocol PokemonDetailsInteractorProtocol {
    func pokemonDetails(id: Int, query: [URLQueryItem],completion: @escaping (Result<PokemonDetailsModel, Error>) -> Void)
}

final class PokemonDetailsInteractor: PokemonDetailsInteractorProtocol {
    
    private let dependencies: PokemonDetailsInteractorDependenciesProtocol
    private var cancellable: AnyCancellable?
    
    init(dependencies: PokemonDetailsInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
    func pokemonDetails(id: Int,
                     query: [URLQueryItem],
                     completion: @escaping (Result<PokemonDetailsModel, Error>) -> Void) {
        
        cancellable = dependencies.pokemonDetails(query: query, .pokemonDetails(id: id))
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
