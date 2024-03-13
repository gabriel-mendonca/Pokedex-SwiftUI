//
//  SignUpView.swift
//  Pokedex
//
//  Created by Gabriel on 28/02/24.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var viewModel: SignUpViewModel = SignUpViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                imageTrainer
                
                titleAndDescription
                Spacer().frame(height: 32)
                buttonsLogin
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .bottom)
            .padding(.bottom)
            .navigationBarBackButtonHidden(true)
        .modifier(MyCustomToolbar(title: "Criar conta"))
        }
    }
    
    var imageTrainer: some View {
        Image("trainer4")
    }
    
    var titleAndDescription: some View {
        VStack(spacing: 16) {
            Text("Falta pouco para explorar esse mundo!")
                .foregroundStyle(PokedexColors.primary)
                .font(FontMaker.makeFont(.poppinsMedium, 26))
                .multilineTextAlignment(.center)
            
            Text("Como deseja se conectar?")
                .foregroundStyle(PokedexColors.secondary)
                .font(FontMaker.makeFont(.poppinsRegular, 14))
                .multilineTextAlignment(.center)
        }
    }
    
    var buttonsLogin: some View {
        VStack(spacing: 12) {
            buttonAppleLogin
            buttonGoogleLogin
            buttonEmailLogin
        }
        .padding(.horizontal)
    }
        
        var buttonAppleLogin: some View {
            NavigationLink {
                
            } label: {
               Capsule()
                    .stroke(PokedexColors.lightGray, lineWidth: 2)
                    .foregroundStyle(.white)
                    .frame(height: 58)
            }
            .overlay {
                HStack(spacing: 16) {
                    Image("appleLogo")
                    Text("Continuar com a Apple")
                        .foregroundStyle(PokedexColors.gray700)
                        .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                }
            }
        }
        
        var buttonGoogleLogin: some View {
            NavigationLink {
                
            } label: {
                Capsule()
                    .stroke(PokedexColors.lightGray, lineWidth: 2)
                    .frame(height: 58)
                    .overlay {
                        HStack(spacing: 16) {
                            Image("googleLogo")
                            Text("Continuar com o Google")
                                .foregroundStyle(PokedexColors.gray700)
                                .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                        }
                    }
            }
        }
        
        var buttonEmailLogin: some View {
            NavigationLink {
                SignUpEmailView(viewModel: self.viewModel)
            } label: {
                Rectangle()
                    .clipShape(.capsule)
                    .foregroundStyle(PokedexColors.blue)
                    .frame(height: 58)
                    .overlay {
                        Text("Continuar com um e-mail")
                            .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                            .foregroundStyle(.white)
                    }
            }
        }
}

#Preview {
    SignUpView()
}
