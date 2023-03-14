//
//  PokemonMenuViewController+Delegate.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 13/3/23.
//

import UIKit

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
