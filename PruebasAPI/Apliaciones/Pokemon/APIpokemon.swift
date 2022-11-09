//
//  APIpokemon.swift
//  PruebasAPI
//
//  Created by Luciano Nicolini on 04/11/2022.
//

import Foundation

final class NetworkPokemon: ObservableObject {
    @Published var pokemons = [PokemonDataModel]()
    
    func getPokemons() {
        if let url = URL(string: "https://pokeapi.co/api/v2/pokemon") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data,response,error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(PokemonResponseDataModel.self, from: safeData)
                            DispatchQueue.main.async {
                                self.pokemons = results.pokemons
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

