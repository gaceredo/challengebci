# ChallengeBCI

## Description

This repository contains the solution of the Pokemon App implemented for the iOS Challenge of BCI

### Navigation flow

The app has the following navigation flow:
- Pokemon List
- Pokemons Details
- Pokemon Menu

### Specification of the API

#### Pokemon List
URL:  https://pokeapi.co/api/v2/pokemon/

#### Pokemons Details
  URL:  https://pokeapi.co/api/v2/pokemon/{id_pokemon}/

  Parameters:
  - id_pokemon

#### Pokemons Menu
  URL:  https://pokeapi.co/api/v2/

#### Download Image
URL:  https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/{id_pokemon}.png

Parameters:
- id_pokemon

## Requirements
- Xcode 13.0
- Cocoapods
- Minimum iOS Target 14.0

## Implementation

### Architecture

The software design was based in Interaction Driven Design (IDD). This approuch helps focus on modelling behaviour according to the external usage of the system. 
The project has three folders that describes the layers of the architecture.
Delivery, Domain (Core in the project) and Infraestructure. The Delivery layer was implemented using VIPER.

### ChallengeBCI
This is the main application. 
The project has the following dependencies
- Kingfisher
- MBProgressHUD
- RealmSwift

> Important!
> The snapshots was saved using the iPhone 14 Pro device.

### Screens

#### Pokemon List
<p align="center">
  <img src="https://i.ibb.co/vhBNWVv/Simulator-Screen-Shot-i-Phone-14-2023-03-13-at-11-50-14.png" width="250" title="hover text">
    <img src="https://i.ibb.co/ykPbz6f/Simulator-Screen-Shot-i-Phone-14-2023-03-13-at-11-50-36.png" width="250" title="hover text">
</p>

#### Pokemon Details
<p align="center">
  <img src="https://i.ibb.co/KXhk4Kz/Simulator-Screen-Shot-i-Phone-14-2023-03-13-at-11-50-27.png" width="250">
</p>

#### Pokemon Menu
<p align="center">
    <img src="https://i.ibb.co/SQngJsT/Simulator-Screen-Shot-i-Phone-14-2023-03-13-at-11-50-17.png" width="250" title="hover text">
    <img src="https://i.ibb.co/tXrC1Bz/Simulator-Screen-Shot-i-Phone-14-2023-03-13-at-11-50-22.png" width="250" title="hover text">
</p>
