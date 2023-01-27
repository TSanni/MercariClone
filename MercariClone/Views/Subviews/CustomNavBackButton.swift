//
//  CustomNavBackButton.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/26/23.
//

import SwiftUI

struct CustomNavBackButton: ViewModifier {
    @Environment(\.dismiss) var dismiss
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                    }

                }
            }
        
    }
}

extension View {
    
    func customNavBackButton() -> some View {
        return self.modifier(CustomNavBackButton())
    }
}


