//
//  WelcomeView.swift
//  Habits
//
//  Created by Mauricio Posada Murillo on 6/02/25.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var selectedItem: WelcomeImageModel = welcomeImages.first!
    @State private var allItems: [WelcomeImageModel] = welcomeImages
    
    var body: some View {
        VStack(spacing: 0) {
            
            Button {
                
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title3.bold())
                    .foregroundStyle(.green.gradient)
                    .contentShape(.rect)
            }
            .padding(15)
            .frame(maxWidth: .infinity, alignment: .leading)
            .opacity(selectedItem.id != allItems[0].id ? 1 : 0)

            
            ZStack {
                
            }
            .frame(height: 250)
            .frame(maxHeight: .infinity)
            
            VStack(spacing: 6) {
                Text(selectedItem.title)
                    .font(.title.bold())
                    .contentTransition(.numericText())
                
                Text("Our app description here!")
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                Button {
                    
                } label: {
                    Text(selectedItem.id == allItems.last?.id ? "Continue" : "Next")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 250)
                        .padding(.vertical, 12)
                        .background(.green.gradient, in: .buttonBorder)
                }
                .padding(.top, 25)
                
                HStack(spacing: 4) {
                    ForEach(allItems) { item in
                        Capsule()
                            .foregroundStyle(.green.gradient)
                            .frame(width: selectedItem.id == item.id ? 50 : 10, height: 10)
                    }
                }
                .padding(.top, 40)
            }
            .multilineTextAlignment(.center)
            .frame(width: 300)
            .frame(maxHeight: .infinity)
        }
    }
}

#Preview {
    WelcomeView()
}
