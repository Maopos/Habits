//
//  WelcomeImageModel.swift
//  Habits
//
//  Created by Mauricio Posada Murillo on 6/02/25.
//

import Foundation
import SwiftUICore

struct WelcomeImageModel: Identifiable {
    var id: String = UUID().uuidString
    var title: String 
    var image: String
    
    var scale: CGFloat = 1
    var anchor: UnitPoint = .center
    var offset: CGFloat = 0
    var rotation: CGFloat = 0
    var zindex: CGFloat = 0
}

let welcomeImages: [WelcomeImageModel] = [
    .init(
        title: "Keep and eye on your workout",
        image: "figure.strengthtraining.traditional.circle.fill",
        scale: 1
    ),
    .init(
        title: "Take a break from work and relax",
        image: "figure.tennis.circle.fill",
        scale: 0.6,
        anchor: .topLeading,
        offset: -70,
        rotation: 30
    ),
    .init(
        title: "Manage and make better use of your time",
        image: "hourglass.circle.fill",
        scale: 0.5,
        anchor: .bottomLeading,
        offset: -60,
        rotation: -35
    ),
    .init(
        title: "Maintain your cardio fitness",
        image: "figure.run.circle.fill",
        scale: 0.4,
        anchor: .bottomLeading,
        offset: -50,
        rotation: 160
    ),
    .init(
        title: "Take care of your health and increase your productivity",
        image: "thermometer.variable.and.figure.circle.fill",
        scale: 0.35,
        anchor: .bottomLeading,
        offset: -50,
        rotation: 250
    )
]
