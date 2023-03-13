//
//  PokemonDetailsGenericCell.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 11/3/23.
//

import UIKit

class PokemonDetailsGenericCell: UITableViewCell, ConfigurableCell {

    @IBOutlet weak var nameStat: UILabel!
    @IBOutlet weak var valueStat: UILabel!
    
    @IBOutlet weak var baseStat: UILabel!
    @IBOutlet weak var valueBaseStat: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(cell: PokemonDetailsTypeCell) {
        switch cell {
        case .abilities:
            nameStat.text = Localizable.PokemonDetails.name.localized
            baseStat.text = Localizable.PokemonDetails.slot.localized
        case .stats:
            nameStat.text = Localizable.PokemonDetails.name.localized
            baseStat.text = Localizable.PokemonDetails.statistics.localized
        }
    }
    func configure(data: PokemonDetailsGenericData) {
        valueStat.text = data.name
        valueBaseStat.text = "\(data.baseStat)"
    }
}

struct PokemonDetailsGenericData {
    let name: String
    let baseStat: Int
}

enum PokemonDetailsTypeCell {
    case stats
    case abilities
}
