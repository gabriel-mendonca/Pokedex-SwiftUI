//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Gabriel on 26/02/24.
//

import SwiftUI
import SwiftData

@available(iOS 17, *)
@main
struct PokedexApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            OnboardingView(viewModel: OnboardingViewModel())
        }
        .modelContainer(sharedModelContainer)
    }
}
