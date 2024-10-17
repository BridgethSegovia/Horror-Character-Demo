//
//  HomeView.swift
//  HorrorDemo
//
//  Created by Bridgeth Segovia on 16/10/24.
//

import SwiftUI

struct HomeView: View {
    @State private var isActive = false
    @State private var animate = false
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Horror Characters")
                        .font(.custom("Creepster-Regular", size: 65))
                        .fontWeight(.bold)
                        .foregroundColor(Color("titleColor"))
                        .shadow(color: Color("homeShadow"), radius: 1.5, x: 2.4, y: 3.2)
                        .padding(.top, 40)
                        .multilineTextAlignment(.center)
                    
                    Image("pumkin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 250)
                        .shadow(color: .red, radius: 10, x: 0, y: 5)
                        .opacity(animate ? 1 : 0.5)
                        .scaleEffect(animate ? 1.7 : 0.5)
                        .animation(
                            Animation.easeInOut(duration: 3)
                                .repeatForever(autoreverses: true)
                        )
                        .padding(.top, 45)
                    
                    Spacer()
                    Text("by Bridgeth Segovia")
                        .foregroundColor(.gray) // Color del texto
                        .font(.system(size: 12, weight: .regular, design: .default))
                        .padding()
                }
                
                .onAppear {
                    animate.toggle() //Animación de la calabaza
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            isActive = true     // Cambiar de vista
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
