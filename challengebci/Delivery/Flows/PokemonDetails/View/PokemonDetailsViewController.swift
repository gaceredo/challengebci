//
//  PokemonDetailsViewController.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//  
//

import UIKit

class PokemonDetailsViewController: BaseViewController {
    
    private var presenter: PokemonDetailsPresenter
    
    init(presenter: PokemonDetailsPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
