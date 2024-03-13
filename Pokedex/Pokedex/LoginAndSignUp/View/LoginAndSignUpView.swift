//
//  LoginAndSignUpView.swift
//  Pokedex
//
//  Created by Gabriel on 28/02/24.
//

import SwiftUI

struct LoginAndSignUpView: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 35) {
                
                jumpButton
                Spacer()
                imageGroupTrainers
                titleAndDescription
                buttons
            }
            .padding()
        }
    }
    
    var jumpButton: some View {
        HStack {
            Text("Pular")
                .font(FontMaker.makeFont(.poppinsMedium, 18))
            Image("arrow.right")
        }
        .frame(maxWidth: .infinity ,alignment: .trailing)
    }
    
    var imageGroupTrainers: some View {
        Image("groupTrainer2")
    }
    
    var titleAndDescription: some View {
        VStack(spacing: 16) {
            Text("Está pronto para essa aventura?")
                .font(FontMaker.makeFont(.poppinsMedium, 26))
                .multilineTextAlignment(.center)
                .foregroundStyle(PokedexColors.primary)
            Text("Basta criar uma conta e começar a explorar o mundo dos Pokémon hoje!")
                .font(FontMaker.makeFont(.poppinsRegular,  14))
                .multilineTextAlignment(.center)
                .foregroundStyle(PokedexColors.secondary)
        }
    }
    
    var buttons: some View {
        VStack(spacing: 20) {
                NavigationLink {
                     SignUpView()
                } label: {
                    Rectangle()
                        .clipShape(.capsule)
                        .foregroundStyle(PokedexColors.blue)
                        .frame(height: 58)
                    
                }
                .overlay {
                    Text("Criar conta")
                        .foregroundStyle(.white)
                        .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                }
            
            Button {
                
            } label: {
                Rectangle()
                    .clipShape(.capsule)
                    .foregroundStyle(.white)
                    .frame(height: 58)
                
            }.overlay {
                Text("Ja tenho uma conta")
                    .foregroundStyle(PokedexColors.blue)
                    .font(FontMaker.makeFont(.poppinsSemiBold, 18))
            }
        }
    }
}

#Preview {
    LoginAndSignUpView()
}
