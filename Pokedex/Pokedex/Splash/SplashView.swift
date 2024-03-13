//
//  SplashView.swift
//  Pokedex
//
//  Created by Gabriel on 28/02/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color("darkBlue")
            Image("pokedexLogo")
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
