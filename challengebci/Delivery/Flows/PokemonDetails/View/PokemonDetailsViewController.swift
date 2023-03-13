//
//  PokemonDetailsViewController.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//  
//

import UIKit

class PokemonDetailsViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: PokemonDetailsPresenter
    var statIndex: Int = 0
    var abilitiesIndex: Int = 0
    
    init(presenter: PokemonDetailsPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        pokemonDetails()
    }

    private func pokemonDetails() {
        showHud()
        presenter.pokemonDetails(completion: { [weak self] isSuccess in
            guard let self = self else { return }
            if isSuccess {
                self.tableView.reloadData()
            } else {
                self.showError(handler: { [weak self] _ in
                    self?.navigationController?.popViewController(animated: true)
                })
            }
            self.hideHud()
        })
    }
    
    private func setupView() {
        title = Localizable.PokemonDetails.title.localized
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(PokemonDetailsProfileCell.self)
        tableView.registerNib(PokemonDetailsGenericCell.self)
        tableView.registerNib(PokemonDetailsHeaderCell.self)
    }
}
