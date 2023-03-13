//
//  PokemonDetailsViewController+Delegate.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import UIKit

extension PokemonDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = presenter.cells[indexPath.row]
        switch cell {
        case .profile:
            let cell: PokemonDetailsProfileCell = tableView.dequeueReusableaCell(forIndexPath: indexPath)
            if let element = presenter.element {
                cell.configure(data: element)
            }
            return cell
        case .stat:
            let cell: PokemonDetailsGenericCell = tableView.dequeueReusableaCell(forIndexPath: indexPath)
            if let allStats = presenter.element?.stats {
                let stat = allStats[statIndex]
                allStats.count - 1 > statIndex ? (statIndex += 1) : (statIndex = 0)
                cell.configure(cell: .stats)
                cell.backgroundColor = statIndex % 2 == 0 ? .systemGray6 : .white
                cell.configure(data: PokemonDetailsGenericData(name: stat.stat.name, baseStat: stat.baseStat))
            }
            return cell
        case .abilities:
            let cell: PokemonDetailsGenericCell = tableView.dequeueReusableaCell(forIndexPath: indexPath)
            if let abilities = presenter.element?.abilities {
                let stat = abilities[abilitiesIndex]
                cell.backgroundColor = abilitiesIndex % 2 == 0 ? .systemGray6 : .white
                abilities.count - 1 > abilitiesIndex ? (abilitiesIndex += 1) : (abilitiesIndex = 0)
                cell.configure(cell: .abilities)
                cell.configure(data: PokemonDetailsGenericData(name: stat.ability.name, baseStat: stat.slot))
            }
            return cell
        case .headerStat:
            let cell: PokemonDetailsHeaderCell = tableView.dequeueReusableaCell(forIndexPath: indexPath)
            cell.configure(data: Localizable.PokemonDetails.statistics.localized)
            return cell
        case .headerAbilities:
            let cell: PokemonDetailsHeaderCell = tableView.dequeueReusableaCell(forIndexPath: indexPath)
            cell.configure(data:  Localizable.PokemonDetails.skills.localized)
            return cell
        }}
}

