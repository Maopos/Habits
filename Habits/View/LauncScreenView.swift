//
//  LauncScreen.swift
//  Habits
//
//  Created by Mauricio Posada Murillo on 15/02/25.
//

import SwiftUI

struct LauncScreenView: View {
    var body: some View {
        ZStack {
            Color.spalshBacground.ignoresSafeArea()
            
            VStack {
                Image(.circle)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240)
            }
        }
    }
}

#Preview {
    LauncScreenView()
}
