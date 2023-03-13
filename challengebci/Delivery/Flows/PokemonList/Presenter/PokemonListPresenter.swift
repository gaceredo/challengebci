//
//  PokemonListPresenter.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//  
//

import Foundation
import Combine

protocol PokemonListPresenterProtocol {
    var pokemonList: [PokemonListModelResult] { get set }
    var menuItems: PokemonMenuModel? {get set}
    var localizedDescription: String { get set }
    func pokemonList(completion: @escaping (Bool) -> Void)
}

final class PokemonListPresenter: PokemonListPresenterProtocol {
    
    var pokemonList: [PokemonListModelResult] = []
    var filterPokemonList: [PokemonListModelResult] = []
    var menuItems: PokemonMenuModel?
    
    var localizedDescription: String = ""
    private var offset: Int = 0
    private var limit: Int = 150
    
    private let interactor: PokemonListInteractorProtocol
    
    init(interactor: PokemonListInteractorProtocol) {
        self.interactor = interactor
    }

    func pokemonList(completion: @escaping (Bool) -> Void) {
        
        let query = [URLQueryItem(name: Localizable.PokemonListView.offset.localized, value: "\(offset)"),
                     URLQueryItem(name: Localizable.PokemonListView.limit.localized, value: "\(limit)")]
        
        interactor.pokemonList(query: query) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let element):
                self.pokemonList = element.results.compactMap { $0 }
                self.filterPokemonList = element.results.compactMap { $0 }
                self.updateUrlDownloadImage()
                completion(true)
            case .failure(let error):
                self.localizedDescription = error.localizedDescription
                completion(false)
            }
        }
    }

    func menuOptions(completion: @escaping (Bool) -> Void)  {
        interactor.menuOptions(query: []) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let element):
                self.menuItems = element
                completion(true)
            case .failure:
                completion(false)
            }
        }
    }

    private func updateUrlDownloadImage() {
        for (index, _) in pokemonList.enumerated() {
            let text = NSLocalizedString(Localizable.PokemonListView.urlImage.localized, comment: "")
            let id = index + 1
            pokemonList[index].url = String.localizedStringWithFormat(text, "\(id)")
            pokemonList[index].id = id
        }
    }
}
