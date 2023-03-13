//
//  PokemonMenuModel.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import Foundation

struct PokemonMenuModel: Decodable, Encodable {
    let ability: String
    let berry: String
    let berryFirmness: String
    let berryFlavor: String
    let characteristic: String
    let contestEffect: String
    let contestType: String
    let eggGroup: String
    let encounterCondition: String
    let encounterConditionValue: String
    let encounterMethod: String
    let evolutionChain: String
    let evolutionTrigger: String
    let gender: String
    let generation: String
    let growthRate: String
    let item: String
    let itemAttribute: String
    let itemCategory: String
    let itemFlingEffect: String
    let itemPocket: String
    let language: String
    let location: String
    let locationArea: String
    let machine: String
    let move: String
    let moveAilment: String
    let moveBattleStyle: String
    let moveCategory: String
    let moveDamageClass: String
    let moveLearnMethod: String
    let moveTarget: String
    let nature: String
    let palParkArea: String
    let pokeathlonStat: String
    let pokedex: String
    let pokemon: String
    let pokemonColor: String
    let pokemonForm: String
    let pokemonHabitat: String
    let pokemonShape: String
    let pokemonSpecies: String
    let region: String
    let stat: String
    let superContestEffect: String
    let type: String
    let version: String
    let versionGroup: String
    
    func convertIntoDict() -> Dictionary<String, String> {
        var dict = Dictionary<String, String>()
        dict["ability"] = self.ability
        dict["berry"] = self.berry
        dict["berryFirmness"] = self.berryFirmness
        dict["berryFlavor"] = self.berryFlavor
        dict["characteristic"] = self.characteristic
        dict["contestEffect"] = self.contestEffect
        return dict
    }
    
    enum CodingKeys: String, CodingKey {
        case ability = "ability"
        case berry = "berry"
        case berryFirmness = "berry-firmness"
        case berryFlavor = "berry-flavor"
        case characteristic = "characteristic"
        case contestEffect = "contest-effect"
        case contestType = "contest-type"
        case eggGroup = "egg-group"
        case encounterCondition = "encounter-condition"
        case encounterConditionValue = "encounter-condition-value"
        case encounterMethod = "encounter-method"
        case evolutionChain = "evolution-chain"
        case evolutionTrigger = "evolution-trigger"
        case gender = "gender"
        case generation = "generation"
        case growthRate = "growth-rate"
        case item = "item"
        case itemAttribute = "item-attribute"
        case itemCategory = "item-category"
        case itemFlingEffect = "item-fling-effect"
        case itemPocket = "item-pocket"
        case language = "language"
        case location = "location"
        case locationArea = "location-area"
        case machine = "machine"
        case move = "move"
        case moveAilment = "move-ailment"
        case moveBattleStyle = "move-battle-style"
        case moveCategory = "move-category"
        case moveDamageClass = "move-damage-class"
        case moveLearnMethod = "move-learn-method"
        case moveTarget = "move-target"
        case nature = "nature"
        case palParkArea = "pal-park-area"
        case pokeathlonStat = "pokeathlon-stat"
        case pokedex = "pokedex"
        case pokemon = "pokemon"
        case pokemonColor = "pokemon-color"
        case pokemonForm = "pokemon-form"
        case pokemonHabitat = "pokemon-habitat"
        case pokemonShape = "pokemon-shape"
        case pokemonSpecies = "pokemon-species"
        case region = "region"
        case stat = "stat"
        case superContestEffect = "super-contest-effect"
        case type = "type"
        case version = "version"
        case versionGroup = "version-group"
        
        
    }
}
