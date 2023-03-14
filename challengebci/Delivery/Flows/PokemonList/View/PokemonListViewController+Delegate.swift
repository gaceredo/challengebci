//
//  PokemonListViewController+Delegate.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import UIKit

extension PokemonListViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.titleView = nil
        configureSearchBarButton()
        inSearchMode = false
        collectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" || searchBar.text == nil {
            inSearchMode = false
            collectionView.reloadData()
            view.endEditing(true)
        } else {
            inSearchMode = true
            presenter.filterPokemonList = presenter.pokemonList.filter({ $0.name.range(of: searchText.lowercased()) != nil })
            collectionView.reloadData()
        }
    }
}

extension PokemonListViewController: UICollectionViewDelegate,
                                     UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inSearchMode ? presenter.filterPokemonList.count : presenter.pokemonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PokemonListCell = collectionView.dequeueReusableaCell(forIndexPath: indexPath)
        let item = inSearchMode ? presenter.filterPokemonList[indexPath.row] : presenter.pokemonList[indexPath.row]
        cell.configure(data: item)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 3) - 20, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = inSearchMode ? presenter.filterPokemonList[indexPath.row] : presenter.pokemonList[indexPath.row]
        let controller = PokemonDetailsWireFrame.makePokemonDetailsView(id: item.id)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
