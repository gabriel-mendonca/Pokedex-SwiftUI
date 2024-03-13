//
//  OnboardingView.swift
//  Pokedex
//
//  Created by Gabriel on 27/02/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        ZStack {
            if viewModel.showSplash {
                SplashView()
            } else {
                onboardingTabView
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
                withAnimation {
                    self.viewModel.showSplash = false
                }
            }
        }
    }
    
    var onboardingTabView: some View {
        NavigationView {
            TabView(selection: $viewModel.currentStep) {
                ForEach(Array(viewModel.onboardingSteps.enumerated()), id: \.offset) { index, step in
                    VStack {
                        trainerImage(stepIndex: index)
                        Spacer().frame(height: 45)
                        titleAndDescription(title: step.title,
                                            description: step.description)
                        Spacer().frame(height: 50)
                        continuebutton(buttonText: step.buttonTitle)
                        
                    }
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity,
                           alignment: .bottom)
                    .padding()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay {
                onboardingProgressView
        }
        }

    }
    
    var onboardingProgressView: some View {
        HStack {
            ForEach(viewModel.onboardingSteps.indices, id: \.self) { index in
                Capsule()
                    .foregroundStyle(viewModel.currentStep == index ? PokedexColors.blue : PokedexColors.secondary)
                    .frame(width: viewModel.currentStep == index ? 28 : 9, height: 9)
                    .animation(.bouncy, value: viewModel.currentStep)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .padding(.bottom, 95)
    }
    
    func trainerImage(stepIndex: Int) -> some View {
        if stepIndex == 0 {
            Image("onboardingImage")
        } else {
            Image("trainer3")
        }
        
    }
    
    func titleAndDescription(title: String, description: String) -> some View {
        VStack(spacing: 16) {
            Text(title)
                .font(FontMaker.makeFont(.poppinsMedium, 26))
                .multilineTextAlignment(.center)
                .foregroundStyle(PokedexColors.primary)
            
            Text(description)
                .font(FontMaker.makeFont(.poppinsRegular, 14))
                .multilineTextAlignment(.center)
                .foregroundStyle(PokedexColors.secondary)
        }
    }
    
    @ViewBuilder
    func continuebutton(buttonText: String) -> some View {
        if viewModel.currentStep == 0 {
            Button(action: {
                withAnimation {
                    viewModel.currentStep = 1
                }
            }, label: {
                Rectangle()
                    .frame(height: 58)
                    .clipShape(.capsule)
                    .foregroundStyle(PokedexColors.blue)
                    .overlay {
                        Text(buttonText)
                            .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                            .foregroundStyle(Color(.white))
                    }
            })
        } else {
            NavigationLink(destination: LoginAndSignUpView().navigationBarBackButtonHidden(true)) {
                Rectangle()
                    .frame(height: 58)
                    .clipShape(.capsule)
                    .foregroundStyle(PokedexColors.blue)
                    .overlay {
                        Text(buttonText)
                            .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                            .foregroundStyle(Color(.white))
                    }
            }
        }
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
}
