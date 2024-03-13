//
//  OnboardingViewModel.swift
//  Pokedex
//
//  Created by Gabriel on 27/02/24.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var showSplash: Bool = true
    @Published var currentStep: Int = 0
    @Published var onboardingSteps: [OnboardingStep] = [
        OnboardingStep(title: "Todos os Pokémons em um só Lugar",
                       description: "Acesse uma vasta lista de Pokémon de todas as gerações já feitas pela Nintendo",
                       buttonTitle: "Continuar"),
        OnboardingStep(title: "Mantenha sua Pokédex atualizada",
                       description: "Cadastre-se e mantenha seu perfil, pokémon favoritos, configurações e muito mais, salvos no aplicativo, mesmo sem conexão com a internet.",
                       buttonTitle: "Vamos começar!")
    ]
}
