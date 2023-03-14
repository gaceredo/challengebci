//
//  PokemonListInteractorMock.swift
//  challengebciTests
//
//  Created by Gustavo Aceredo on 13/3/23.
//

import Foundation
import Combine
import challengebci

class PokemonListInteractorMock {
    
    private let dependencies: PokemonListInteractorDependenciesMock
    private var cancellable: AnyCancellable?
    
    var invokedExecute = false
    var invokedExecuteCount = 0
    var isSuccess: Bool = true
    
    init(dependencies: PokemonListInteractorDependenciesMock) {
        self.dependencies = dependencies
    }
    
    func pokemonListSuccess(query: [URLQueryItem],
                            completion: @escaping (Result<PokemonListModelMock, Error>) -> Void) {
        cancellable = dependencies.pokemonListSuccess(query: query, .pokemonListSuccess)
            .sink(receiveCompletion: { result in
                
                switch result {
                case .finished : break
                case .failure(let error):
                    self.isSuccess = false
                    completion(.failure(error))
                }
            },receiveValue: {
                self.isSuccess = true
                self.invokedExecute = true
                self.invokedExecuteCount += 1
                completion(.success($0))
            })
    }
    
    func pokemonListFail(query: [URLQueryItem],
                         completion: @escaping (Result<PokemonListModelMock, Error>) -> Void) {
        cancellable = dependencies.pokemonListFail(query: query, .pokemonListFail)
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
