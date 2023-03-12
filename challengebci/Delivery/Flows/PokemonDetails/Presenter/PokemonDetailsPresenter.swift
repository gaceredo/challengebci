//
//  PokemonDetailsPresenter.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//  
//

import Foundation
import Combine

protocol PokemonDetailsPresenterProtocol {
    var result: [String] { get set }
}

final class PokemonDetailsPresenter: PokemonDetailsPresenterProtocol, ObservableObject {
    var result: [String] = []
    
    private let interactor: PokemonDetailsInteractorProtocol
    
    init(interactor: PokemonDetailsInteractorProtocol) {
        self.interactor = interactor
    }
}
