//
//  PokemonDetailsPresenter.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//  
//

import Foundation

protocol PokemonDetailsPresenterProtocol {
    var element: PokemonDetailsModel? { get set }
}

final class PokemonDetailsPresenter: PokemonDetailsPresenterProtocol {
    
    var pokemonId: Int
    var cells: [PokemonDetailsCells] = []
    var element: PokemonDetailsModel?
    
    private let interactor: PokemonDetailsInteractorProtocol
    
    init(interactor: PokemonDetailsInteractorProtocol,
         pokemonId: Int) {
        self.interactor = interactor
        self.pokemonId = pokemonId
    }
    
    func pokemonDetails(completion: @escaping (Bool) -> Void) {
        interactor.pokemonDetails(id: pokemonId,
                               query: []) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let element):
                self.element = element
                self.getProfile()
                self.getStats(element)
                self.getAbilities(element)
                completion(true)
            case .failure:
                completion(false)
            }
        }
    }
    
    private func getStats(_ element: PokemonDetailsModel) {
        if !element.stats.isEmpty {
            self.cells.append(.headerStat)
            element.stats.forEach { _ in
                self.cells.append(.stat)
            }
        }
    }
    
    func getProfile() {
        self.cells.append(.profile)
    }
    func getAbilities(_ element: PokemonDetailsModel) {
        if !element.abilities.isEmpty {
            self.cells.append(.headerAbilities)
            element.abilities.forEach { _ in
                self.cells.append(.abilities)
            }
        }
    }
}

enum PokemonDetailsCells {
    case profile
    case headerStat
    case headerAbilities
    case abilities
    case stat
}
