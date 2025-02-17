//
//  ViewExtensions.swift
//  Habits
//
//  Created by Mauricio Posada Murillo on 8/02/25.
//

import SwiftUI

extension View {
    
    @ViewBuilder
    func hSpacing(_ aligment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: aligment)
    }
    @ViewBuilder
    func vSpacing(_ aligment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: aligment)
    }
}
