//
//  PokemonDetailView.swift
//  HelloWorld
//
//  Created by Esau David Olvera on 25/05/23.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack(spacing: 10) {
            PokemonView(pokemon: pokemon)
            
            Text("ID: \(vm.pokemonDetails?.id ?? 0)")
            Text("Weight: \(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) kg")
            Text("Height: \(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) m")
        }
        .onAppear {
            vm.getDetails(pokemon: pokemon)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
