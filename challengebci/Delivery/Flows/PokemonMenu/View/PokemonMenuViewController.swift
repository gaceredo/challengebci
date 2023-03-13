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
    
    private var presenter: PokemonMenuPresenter
    
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
    }
    
    func pokemonDetails() {
        self.showHud()
        presenter.pokemonDetails(completion: {[weak self]_ in
            guard let self = self else  { return }
            self.tableView.reloadData()
            self.hideHud()
        })
    }
    private func setupView() {
        title = Localizable.PokemonDetails.title.localized
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(PokemonMenuCell.self)
    }
}

extension PokemonMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PokemonMenuCell = tableView.dequeueReusableaCell(forIndexPath: indexPath)
        let item = presenter.results[indexPath.row]
        cell.backgroundColor = indexPath.row % 2 == 0 ? .systemGray6 : .white
        cell.configure(data: item)
        return cell
    }
}
