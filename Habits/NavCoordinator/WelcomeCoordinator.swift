//
//  WelcomeCoordinator.swift
//  Habits
//
//  Created by Mauricio Posada Murillo on 8/02/25.
//

import SwiftUI

enum WelcomeCoordinatorPage: Hashable, View {
    case welcomePage
    case loginPage
    
    var body: some View {
        switch self {
        case .welcomePage:
            WelcomeView()
        case .loginPage:
            LoginView()
        }
    }
}

enum WelcomeCoordinatorSheet: String, Identifiable, View {
    var id: String { self.rawValue }
    
    case vacio
    
    var body: some View {
        switch self {
        case .vacio:
            EmptyView()
        }
    }
}

enum WelcomeCoordinatorCover: String, Identifiable, View {
    var id: String { self.rawValue }
    
    case vacio
    
    var body: some View {
        switch self {
        case .vacio:
            EmptyView()
        }
    }
}

extension EnvironmentValues {
    @Entry var welcomeCoordinator = WelcomeCoordinator()
}

@Observable
class WelcomeCoordinator {
    
    var path: NavigationPath = NavigationPath()
    var sheet: WelcomeCoordinatorSheet?
    var cover: WelcomeCoordinatorCover?
    
    func push(page: WelcomeCoordinatorPage) {
        path.append(page)
    }
    
    func pop(last: Int = 1) {
        path.removeLast(last)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func present(sheet: WelcomeCoordinatorSheet) {
        self.sheet = sheet
    }
    
    func present(cover: WelcomeCoordinatorCover) {
        self.cover = cover
    }
    
    func popSheet() {
        self.sheet = nil
    }
    
    func popCover() {
        self.cover = nil
    }
}
