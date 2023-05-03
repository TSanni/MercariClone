//
//  CartView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/22/23.
//

import SwiftUI

struct CartView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "cart")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("Your shopping cart is empty")
                .fontWeight(.bold)
                .font(.headline)
            
            Text("Looking for ideas?")
                .foregroundColor(.secondary)
            
            Button {
                dismiss()
            } label: {
                Text("See popular items")
                    .fontWeight(.semibold)
                    .foregroundColor(.mercariPurple)
            }
            .padding()

            
        }
        .navigationTitle("Cart")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .customNavBackButton()
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CartView()
        }
    }
}

