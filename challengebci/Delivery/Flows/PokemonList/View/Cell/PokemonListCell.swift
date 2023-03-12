//
//  PokemonListCell.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import UIKit
import Kingfisher

class PokemonListCell: UICollectionViewCell, ConfigurableCell {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(data: PokemonListModelResult) {
        self.pokemonName.text = data.name
        if let url = URL(string: data.url) {
            let resource = ImageResource(downloadURL: url, cacheKey: data.url)
            self.pokemonImage.kf.setImage(with: resource)
        } else {
            self.pokemonImage.image = UIImage()
        }
    }
}
