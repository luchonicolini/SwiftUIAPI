//
//  HomePokemon.swift
//  PruebasAPI
//
//  Created by Luciano Nicolini on 04/11/2022.
//

import SwiftUI

struct HomePokemon: View {
    @ObservedObject var PokemonViewModel = NetworkPokemon()
    
    var body: some View {
        NavigationStack {
            List(PokemonViewModel.pokemons, id: \.name) { index in
                HStack {
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                    Text(index.name)
                        .foregroundColor(.primary)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Pokemons")
        }
        .onAppear {
            self.PokemonViewModel.getPokemons()
        }
    }
}

struct HomePokemon_Previews: PreviewProvider {
    static var previews: some View {
        HomePokemon()
    }
}
