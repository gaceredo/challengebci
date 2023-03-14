//
//  PokemonMenuCell.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 13/3/23.
//

import UIKit

class PokemonMenuCell: UITableViewCell, ConfigurableCell {

    @IBOutlet weak var nameValue: UILabel!
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var urlTitle: UILabel!
    @IBOutlet weak var urlValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.nameTitle.text = Localizable.PokemonDetails.name.localized
        self.urlTitle.text = Localizable.PokemonDetails.url.localized
    }
    
    func configure(data: PokemonMenuDetailsResult) {
        self.nameValue.text = data.name
        self.urlValue.text = data.url
    }
    
}
