//
//  PokemonMenuViewController.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 13/3/23.
//  
//

import UIKit

class PokemonMenuViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: PokemonMenuPresenter
    
    init(presenter: PokemonMenuPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonDetails()
        setupView()
        getTitle() 
    }
    
    private func pokemonDetails() {
        self.showHud()
        presenter.pokemonDetails(completion: {[weak self]_ in
            guard let self = self else  { return }
            self.tableView.reloadData()
            self.hideHud()
        })
    }
    
    private func setupView() {
       
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(PokemonMenuCell.self)
    }
    
    private func getTitle() {
        let text = NSLocalizedString(Localizable.PokemonMenu.title.localized, comment: "")
        title = String.localizedStringWithFormat(text, "\(presenter.category)")
    }
}
