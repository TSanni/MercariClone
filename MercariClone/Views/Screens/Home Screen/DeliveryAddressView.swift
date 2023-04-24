//
//  DeliveryAddressView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/18/23.
//

import SwiftUI

struct DeliveryAddressView: View {
    @State private var zipCodeEntry = ""
    @FocusState private var focus: Bool
    var body: some View {
        ZStack {
            Color.white.opacity(0.000001) //to enable an onTapGesture to resign keyboard
            VStack {
                Text("Enter a zip code")
                    .fontWeight(.semibold)
                    .padding()
                TextField("", text: $zipCodeEntry)
                    .focused($focus)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .tint(.mercariPurple)
                
                Rectangle()
                    .fill(focus ? Color.mercariPurple : Color.mercariGray)
                    .frame(height: 1)
                
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(zipCodeEntry.count < 5 ? Color.mercariGray : Color.mercariPurple)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                        Text("Apply")
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .disabled(zipCodeEntry.count < 5 ? true : false)
                
                Button {
                    
                } label: {
                    Text("Add new address")
                        .fontWeight(.semibold)
                        .foregroundColor(.mercariPurple)
                }


            }
            .padding()
        }
        .onTapGesture {
            focus = false
        }
    }
}

struct DeliveryAddressView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryAddressView()
    }
}
