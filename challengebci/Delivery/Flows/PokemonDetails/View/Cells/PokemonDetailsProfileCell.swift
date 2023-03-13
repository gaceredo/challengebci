//
//  PokemonDetailsProfileCell.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 11/3/23.
//

import UIKit
import Kingfisher

class PokemonDetailsProfileCell: UITableViewCell, ConfigurableCell {

    @IBOutlet weak var namePokemon: UILabel!
    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var orderPokemon: UILabel!
    @IBOutlet weak var heightPokemon: UILabel!
    @IBOutlet weak var experiencePokemon: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(data: PokemonDetailsModel) {
        self.namePokemon.text = "\(Localizable.PokemonDetails.name.localized) \(data.name)"
        self.orderPokemon.text = "\(Localizable.PokemonDetails.order.localized) \(data.order)"
        self.heightPokemon.text = "\(Localizable.PokemonDetails.height.localized) \(data.height)"
        self.experiencePokemon.text = "\(Localizable.PokemonDetails.experience.localized) \(data.base_experience)"
        self.downloadImage(id: data.id)
    }
    
    func downloadImage(id: Int) {
        let text = NSLocalizedString(Localizable.PokemonListView.urlImage.localized, comment: "")
        let urlString = String.localizedStringWithFormat(text, "\(id)")
        
        if let url = URL(string: urlString) {
            let resource = ImageResource(downloadURL: url, cacheKey: urlString)
            self.imagePokemon.kf.setImage(with: resource)
        } else {
            self.imagePokemon.image = UIImage()
        }
    }
}

