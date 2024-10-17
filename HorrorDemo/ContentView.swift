//
//  ContentView.swift
//  HorrorDemo
//
//  Created by Bridgeth Segovia on 16/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var characterLoader = CharacterLoader()
    
    var body: some View {
        NavigationView {
            List(characterLoader.characters) { character in
                NavigationLink(destination: CharacterDetailView(character: character)) {
                    HStack {
                        Image(character.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text(character.name)
                                .font(.headline)
                            Text(character.movie)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Horror Characters")
            
        }
        .preferredColorScheme(.dark)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
