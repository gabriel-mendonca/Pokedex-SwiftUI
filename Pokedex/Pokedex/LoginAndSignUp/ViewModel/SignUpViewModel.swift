//
//  SignUpViewModel.swift
//  Pokedex
//
//  Created by Gabriel on 06/03/24.
//

import Foundation

class SignUpViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var emailFocused: Bool = false
}
