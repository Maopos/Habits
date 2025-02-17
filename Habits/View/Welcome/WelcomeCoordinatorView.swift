//
//  WelcomeCoordinatorView.swift
//  Habits
//
//  Created by Mauricio Posada Murillo on 8/02/25.
//

import SwiftUI

struct WelcomeCoordinatorView: View {
    
    @AppStorage("isWelcomeComplete") private var isWelcomeComplete: Bool = false
    @State private var coordinator = WelcomeCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            if isWelcomeComplete {
                WelcomeCoordinatorPage.loginPage
                    .navigationDestination(for: WelcomeCoordinatorPage.self) { $0 }
                    .sheet(item: $coordinator.sheet) { $0 }
                    .fullScreenCover(item: $coordinator.cover) { $0 }
            } else {
                WelcomeCoordinatorPage.welcomePage
                    .navigationDestination(for: WelcomeCoordinatorPage.self) { $0 }
                    .sheet(item: $coordinator.sheet) { $0 }
                    .fullScreenCover(item: $coordinator.cover) { $0 }
            }
        }
        .environment(\.welcomeCoordinator, coordinator)
    }
}

#Preview {
    WelcomeCoordinatorView()
}
