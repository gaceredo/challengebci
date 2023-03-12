//
//  PokemonListViewController.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//  
//

import UIKit

class PokemonListViewController: BaseViewController {
    
    var presenter: PokemonListPresenter
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchBar: UISearchBar!
    var inSearchMode = false
    
    init(presenter: PokemonListPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonList()
        configureSearchBarButton()
        setupUI()
    }
    
    func pokemonList() {
        DispatchQueue.main.async {
            self.showHud()
            self.presenter.pokemonList(completion: {[weak self] isSuccess in
                guard let self = self else { return }
                if isSuccess {
                    self.collectionView.reloadData()
                } else {
                   // show error
                }
                self.hideHud()
            })
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 18)
    }
    
    func setupUI() {
        title = Localizable.PokemonListView.title.localized
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(PokemonListCell.self)
    }
    
    func configureSearchBar() {
        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.showsCancelButton = true
        searchBar.becomeFirstResponder()
        searchBar.tintColor = .black
        navigationItem.rightBarButtonItem = nil
        navigationItem.titleView = searchBar
    }
    
    func configureSearchBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                            target: self, action: #selector(showSearchBar))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func showSearchBar() {
        configureSearchBar()
    }

}
