//
//  CharacterDetailView.swift
//  HorrorDemo
//
//  Created by Bridgeth Segovia on 16/10/24.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: HorrorCharacter

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 25) {
                Text(character.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                Text(character.characterType)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
                
                Image(character.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: Color("quoteColor").opacity(1.0), radius: 10, x: 0, y: 5)
                
                if !character.quote.isEmpty {
                    Text("“\(character.quote)”")
                        .foregroundColor(Color("quoteColor"))
                        .italic()
                        .multilineTextAlignment(.center)
                }
                
                Text(character.description)
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
            .navigationTitle(character.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: HorrorCharacter(id: 1, name: "Annie Wilkes", description: "Una enfermera obsesionada y peligrosa, conocida por su amor a la serie 'Misery' y su fanatismo incontrolable.", movie: "Misery", characterType: "Asesina en serie", image: "annie_wilkes", quote: "I'm your number one fan!"))
    }
}
