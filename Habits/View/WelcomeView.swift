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
    @State private var activeIndex: Int = 0
    
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
                ForEach(allItems) { item in
                    animatedImageView(item)
                }
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
                    updateItem(isFordward: true)
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
    
    @ViewBuilder
    func animatedImageView(_ item: WelcomeImageModel) -> some View {
        
        let isSelected = selectedItem.id == item.id
        
        Image(systemName: item.image)
            .font(.system(size: 80))
            .foregroundStyle(.white.shadow(.drop(radius: 10)))
            .blendMode(.overlay)
            .frame(width: 120, height: 120)
            .background(.green.gradient, in: .rect(cornerRadius: 32))
            .background {
                RoundedRectangle(cornerRadius: 35)
                    .fill(.background)
                    .shadow(color: .primary.opacity(0.2), radius: 3, x: 7, y: 7)
                    .shadow(color: .primary.opacity(0.2), radius: 1, x: -1, y: -1)
                    .padding(3)
                    .opacity(selectedItem.id == item.id ? 1 : 0)
            }
        
            .rotationEffect(.init(degrees: -item.rotation))
            .scaleEffect(isSelected ? 1 : item.scale, anchor: item.anchor)
            .offset(x: item.offset)
            .rotationEffect(.init(degrees: item.rotation))
            .zIndex(isSelected ? 2 : item.zindex)
    }
    
    func updateItem(isFordward: Bool) {
        guard activeIndex != allItems.count - 1 else { return }
        
        activeIndex += 1
        
        let fromIndex = activeIndex - 1
        
        for index in allItems.indices {
            allItems[index].zindex = 0
        }
        
        Task {
            withAnimation(.bouncy(duration: 1)) {
                allItems[fromIndex].scale = allItems[activeIndex].scale
                allItems[fromIndex].rotation = allItems[activeIndex].rotation
                allItems[fromIndex].anchor = allItems[activeIndex].anchor
                allItems[fromIndex].offset = allItems[activeIndex].offset
                
                allItems[fromIndex].zindex = 1
            }
            
            try? await Task.sleep(for: .seconds(0.1))
            
            withAnimation(.bouncy(duration: 0.9)) {
                allItems[activeIndex].scale = 1
                allItems[activeIndex].rotation = .zero
                allItems[activeIndex].anchor = .center
                allItems[activeIndex].offset = .zero
                
                selectedItem = allItems[activeIndex]
            }
        }
    }
}

#Preview {
    WelcomeView()
}
