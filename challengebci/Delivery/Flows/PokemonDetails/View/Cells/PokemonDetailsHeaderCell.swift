//
//  PokemonDetailsHeaderCell.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 11/3/23.
//

import UIKit

class PokemonDetailsHeaderCell: UITableViewCell, ConfigurableCell {

    @IBOutlet weak var titleHeader: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(data: String) {
        self.titleHeader.text = data
    }
}
