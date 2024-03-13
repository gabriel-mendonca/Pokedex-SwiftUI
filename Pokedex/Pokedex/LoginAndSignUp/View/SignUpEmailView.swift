//
//  SignUpEmailView.swift
//  Pokedex
//
//  Created by Gabriel on 06/03/24.
//

import SwiftUI

struct SignUpEmailView: View {
    
    @StateObject var viewModel: SignUpViewModel
    
    var body: some View {
        VStack {
            titleAndDescription
            emailField
            Spacer()
            continueButton
        }
        .padding()
        .navigationBarBackButtonHidden()
        .modifier(MyCustomToolbar(title: "Criar conta"))
    }
    
    var titleAndDescription: some View {
        VStack {
            Text("Vamos comecar")
                .font(FontMaker.makeFont(.poppinsRegular, 26))
            Text("Qual é o seu email!")
                .font(FontMaker.makeFont(.poppinsSemiBold, 26))
        }
    }
    
    var emailField: some View {
        VStack {
            TextField("E-mail", text: $viewModel.email) { editingChanged in
                viewModel.emailFocused = editingChanged
            }
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .font(FontMaker.makeFont(.poppinsRegular, 16))
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 2)
                .foregroundStyle(viewModel.emailFocused ? PokedexColors.primary : PokedexColors.lightGray)
                .frame(height: 52)
            }
            
            Text("Use um endereço de e-mail válido.")
                .font(FontMaker.makeFont(.poppinsRegular, 14))
                .foregroundStyle(PokedexColors.gray700)
        }
    }
    
    var continueButton: some View {
        NavigationLink {
            
        } label: {
            Capsule()
                .frame(height: 58)
                .foregroundStyle(PokedexColors.blue)
                .overlay {
                    Text("Continuar")
                        .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                        .foregroundStyle(.white)
                }
        }
    }
}

#Preview {
    SignUpEmailView(viewModel: SignUpViewModel())
}
