//
//  PokemonDetailsWireFrame.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//  
//

import UIKit

protocol PokemonDetailsWireFrameProtocol {
   static func makePokemonDetailsView() -> UIViewController
}

struct PokemonDetailsWireFrame: PokemonDetailsWireFrameProtocol {
    static func makePokemonDetailsView() -> UIViewController {
        
        let interactorDependencies = PokemonDetailsInteractorDependencies()
        let interactor = PokemonDetailsInteractor(dependencies: interactorDependencies)
        let presenter = PokemonDetailsPresenter(interactor: interactor)
        let view = PokemonDetailsViewController(presenter: presenter)
        
        return view
    }
}
