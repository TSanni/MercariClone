//
//  ButtonStyles.swift
//  MercariClone
//
//  Created by Tomas Sanni on 5/1/23.
//

import Foundation
import SwiftUI

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let cicle = Circle().fill(Color.mercariGray).frame(width: 40, height: 40)

        configuration.label
            .padding(.horizontal, 10)
            .background {
                configuration.isPressed ? cicle : nil
            }
    }
    
    
}
