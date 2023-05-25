//
//  ContentView.swift
//  HelloWorld
//
//  Created by Esau David Olvera on 23/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    
        let columns = [GridItem(.flexible())]
        @State private var searchText = "Buscar Pokemon"
        
        var body: some View {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(vm.filteredPokemon) { pokemon in
                            NavigationLink(destination: PokemonDetailView(pokemon: pokemon)
                            ) {
                                PokemonView(pokemon: pokemon)
                            }
                        }
                    }
                    .animation(.easeInOut(duration: 0.3), value: vm.filteredPokemon.count)
                    .navigationTitle("Pokedex Swift")
                    .navigationBarTitleDisplayMode(.inline)
                }
                .searchable(text: $searchText)
            }
            .environmentObject(vm)
        }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
