//
//  PokemonDetailsWireFrame.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//  
//

import UIKit

protocol PokemonDetailsWireFrameProtocol {
    static func makePokemonDetailsView(id: Int) -> UIViewController
}

struct PokemonDetailsWireFrame: PokemonDetailsWireFrameProtocol {
    static func makePokemonDetailsView(id: Int) -> UIViewController {
        
        let interactorDependencies = PokemonDetailsInteractorDependencies()
        let interactor = PokemonDetailsInteractor(dependencies: interactorDependencies)
        let presenter = PokemonDetailsPresenter(interactor: interactor, pokemonId: id)
        let view = PokemonDetailsViewController(presenter: presenter)
        
        return view
    }
}
